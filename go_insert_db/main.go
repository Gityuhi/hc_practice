package main

import (
	"bufio"
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"os"

	_ "github.com/lib/pq" 
)

type User struct {
	Age  int		`json:"age"`
	Name string		`json:"name"`
	Role string		`json:"role"`
}

type Users struct {
	User  User	 `json:"user"`
    Dist  string `json:"dist"`
    Level string `json:"level"`
    Msg   string `json:"msg"`
    Src   string `json:"src"`
    Time  string `json:"time"`
}

var DbConnection *sql.DB


func main() {
	var err error
	DbConnection, err = sql.Open("postgres", "postgres://postgres:postgres@localhost:5432/postgres?sslmode=disable")
	if err != nil {
		log.Fatalf("DB接続に失敗: %v", err)
	}
	defer DbConnection.Close()
	cmd := `CREATE TABLE IF NOT EXISTS users(
		id SERIAL PRIMARY KEY,
		age INTEGER,
		name VARCHAR(500),
		role CHAR(15)
	)`

	_, err = DbConnection.Exec(cmd)
	if err != nil {
		log.Fatalln(err)
	}

	arg := os.Args

	if len(arg) != 2 {
		fmt.Println("引数の数が間違っています")
		os.Exit(1)
	}

	f, err := os.Open(arg[1])
	if err != nil {
		log.Fatalf("ファイルオープンに失敗: %v", err)
	}
	defer f.Close()

	tx, err := DbConnection.Begin()
    if err != nil {
        log.Fatalf("トランザクションの開始に失敗: %v", err)
    }

	stmt, err := tx.Prepare("INSERT INTO users (age, name, role) VALUES($1, $2, $3)")
	if err != nil {
		tx.Rollback()
        log.Fatalf("Prepared Statementの準備に失敗: %v", err)
    }
	defer stmt.Close()

	s := bufio.NewScanner(f)
    for s.Scan() {
        line := s.Text()


		var u Users
		if err := json.Unmarshal([]byte(line), &u); err != nil {
			log.Printf("JSONパースエラー: %v, line: %s", err, line)
			tx.Rollback()
            log.Fatal("処理を中断します。")
		}
		
		_, err := stmt.Exec(u.User.Age, u.User.Name, u.User.Role)
		if err != nil {
			log.Printf("DB挿入エラー: %v", err)
			tx.Rollback()
            log.Fatal("処理を中断します。")
		}
	}
	if err := s.Err(); err != nil {
		tx.Rollback()
        log.Fatalf("ファイル読み込み中にエラーが発生: %v", err)
    }

	if err := tx.Commit(); err != nil {
        log.Fatalf("コミットに失敗: %v", err)
    }
	
	fmt.Println("全てのデータの挿入が成功しました。")
}
