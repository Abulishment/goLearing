package controllers

import (
	"gin-ranking/models"
	"strconv"

	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
)

type UserController struct {
}

func (u UserController) Register(c *gin.Context) {
	//接收用户名、密码和确认密码
	username := c.DefaultPostForm("username", "")
	password := c.DefaultPostForm("password", "")
	confirmPassword := c.DefaultPostForm("confirmPassword", "")

	if username == "" || password == "" || confirmPassword == "" {
		ReturnError(c, 4001, "请输入正确的信息")
		return
	}

	if password != confirmPassword {
		ReturnError(c, 4001, "密码和确认密码不匹配")
		return
	}

	user, err := models.GetUserInfoByUsername(username)

	if user.Id != 0 && err == nil {
		ReturnError(c, 4001, "用户名已存在")
		return
	}

	_, err = models.AddUser(username, EncryMd5(password))
	if err != nil {
		ReturnError(c, 4001, "保存失败，请联系管理员")
		return
	}

	ReturnSuccess(c, 0, "注册成功", true, 1)
}

type UserApi struct {
	Id       int    `json:"id"`
	Username string `json:"username"`
}

func (u UserController) Login(c *gin.Context) {
	//接收用户名、密码和确认密码
	username := c.DefaultPostForm("username", "")
	password := c.DefaultPostForm("password", "")

	if username == "" || password == "" {
		ReturnError(c, 4001, "请输入正确的信息")
		return
	}

	user, err := models.GetUserInfoByUsername(username)

	if user.Id == 0 || err != nil {
		ReturnError(c, 4001, "用户名或密码不正确")
		return
	}

	if user.Password != EncryMd5(password) {
		ReturnError(c, 4001, "用户名或密码不正确")
		return
	}

	session := sessions.Default(c)
	session.Set("login:"+strconv.Itoa(user.Id), user.Id)
	session.Save()

	data := UserApi{
		Id:       user.Id,
		Username: user.Username,
	}
	ReturnSuccess(c, 0, "登陆成功", data, 1)
}
