package admin

import (
	"CRM/helpers"
	"net/http"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type RequestAdminHandler struct {
	ctrl *ControllerAdmin
}

func NewRequestHandlerAdmin(ctrl *ControllerAdmin) *RequestAdminHandler {
	return &RequestAdminHandler{
		ctrl: ctrl,
	}
}

func DefaultRequestHandlerAdmin(db *gorm.DB) *RequestAdminHandler {
	return NewRequestHandlerAdmin(
		NewControllerAdmin(
			NewUseCaseAdmin(
				NewRepositoryAdmin(db),
			),
		),
	)
}

type CreateAdminRequest struct {
	Username string `json:"username"`
	Password string `json:"password"`
}
type UpdateApproveRequest struct {
	Status string `json:"status"`
}
type ErrorResponse struct {
	Error string `json:"error"`
}
type MessageResponse struct {
	Message string           `json:"message"`
	Data    RegisterApproval `json:"data"`
}
type ActiveResponse struct {
	Message string `json:"message"`
	Data    Actors `json:"data"`
}

type JWTResponse struct {
	Token string `json:"token"`
}

func (h RequestAdminHandler) Create(c *gin.Context) {
	var reqAdmin CreateAdminRequest
	if err := c.BindJSON(&reqAdmin); err != nil {
		c.JSON(http.StatusBadRequest, ErrorResponse{Error: err.Error()})
		return
	}
	res, err := h.ctrl.Create(&reqAdmin)
	if err != nil {
		c.JSON(http.StatusInternalServerError, ErrorResponse{Error: err.Error()})
		return
	}

	c.JSON(http.StatusOK, res)

}

func (h RequestAdminHandler) GetAllApprove(c *gin.Context) {
	res, err := h.ctrl.GetAllApprove()
	if err != nil {
		c.JSON(http.StatusInternalServerError, ErrorResponse{Error: err.Error()})
		return
	}

	c.JSON(http.StatusOK, res)
}
func (h RequestAdminHandler) GetAdminByUsername(c *gin.Context) {
	username := c.Param("username")
	res, err := h.ctrl.FindByUsername(username)
	if err != nil {
		c.JSON(http.StatusInternalServerError, ErrorResponse{Error: err.Error()})
		return
	}

	c.JSON(http.StatusOK, res)
}

func (h RequestAdminHandler) ApproveByID(c *gin.Context) {
	id := c.Param("id")
	data, err := h.ctrl.FindApprovalID(id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, ErrorResponse{Error: err.Error()})
		return
	}
	if err := c.BindJSON(&data); err != nil {
		c.JSON(http.StatusBadRequest, ErrorResponse{Error: err.Error()})
		return
	}
	err = h.ctrl.UpdateApprove(data)
	if err != nil {
		c.JSON(http.StatusInternalServerError, ErrorResponse{Error: err.Error()})
		return
	}

	c.JSON(http.StatusOK, MessageResponse{
		Message: "Update Approval Success",
		Data:    *data,
	})
}

func (h RequestAdminHandler) ActiveAdmin(c *gin.Context) {
	id := c.Param("id")
	data, err := h.ctrl.FindAdminByID(id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, ErrorResponse{Error: err.Error()})
		return
	}
	data.Active = ActiveTrue
	err = h.ctrl.UpdateActiveAdmin(data)
	if err != nil {
		c.JSON(http.StatusInternalServerError, ErrorResponse{Error: err.Error()})
		return
	}

	c.JSON(http.StatusOK, ActiveResponse{Message: "Active/Deactive Admin Success", Data: *data})
}

func (h RequestAdminHandler) Login(c *gin.Context) {
	var admin Actors
	if err := c.BindJSON(&admin); err != nil {
		c.JSON(http.StatusBadRequest, ErrorResponse{Error: err.Error()})
		return
	}
	password := admin.Password
	username := admin.Username
	data, err := h.ctrl.FindByUsername(username)

	if err != nil {
		c.JSON(http.StatusInternalServerError, ErrorResponse{Error: err.Error()})
		return
	}
	comparePass := helpers.ComparePass([]byte(data.Password), []byte(password))
	if !comparePass {
		c.JSON(http.StatusUnauthorized, ErrorResponse{Error: "Password salah"})
		return
	}
	//
	token := helpers.GenerateToken(data.Id, data.Username)

	c.JSON(http.StatusOK, JWTResponse{Token: token})
}

func (h RequestAdminHandler) DeleteAdminByID(c *gin.Context) {
	id := c.Param("id")

	data, err := h.ctrl.FindAdminByID(id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, ErrorResponse{Error: err.Error()})
		return
	}

	if err = h.ctrl.DeleteAdminById(data); err != nil {
		c.JSON(http.StatusInternalServerError, ErrorResponse{Error: err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Admin deleted success"})
}
