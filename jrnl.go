package main

import (
	"fmt"
	"os"
	"os/exec"

	"github.com/urfave/cli"
)

var app = cli.NewApp()

func info() {
	app.Name = "Journeling CLI App"
	app.Usage = "To automate the process of creating directory and daily log files, with the help of some custom written powershell scripts"
	app.Author = "Abhishek K K - The Ronin"
	app.Version = "1.0.0"
}

func commands() {
	var projectname string

	app.Commands = []cli.Command{
		{
			Name:    "init",
			Aliases: []string{"i", "in"},
			Usage:   "Initializes a journel for a project, creates a directory, and create a markdown file and open it in vscode to edit",
			Action: func(c *cli.Context) {

				if c.Args().First() != "" {
					projectname = c.Args().First()
				}

				out, err := exec.Command("cmd", "/c", "powershell", "init", projectname).Output()

				if err != nil {
					fmt.Println("\"jrnl init\" not working")
				} else {
					fmt.Println(string(out))
				}
			},
		},
		// {
		// 	Name:    "write",
		// 	Aliases: []string{"wr", "w", "edit"},
		// 	Usage:   "To write or edit daily logs",
		// 	Action: func(c *cli.Context) {

		// 	},
		// },
	}
}

func main() {
	info()
	commands()

	err := app.Run(os.Args)

	if err != nil {
		fmt.Printf("Cli app not working...")
	}
}
