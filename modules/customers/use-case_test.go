package customers

import (
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/mock"
	"gorm.io/gorm"
	"testing"
)

type mockCustomerRepo struct {
	mock.Mock
}

func (m *mockCustomerRepo) GetAllCustomer(page int, email string) ([]Customer, error) {
	args := m.Called(page, email)
	return args.Get(0).([]Customer), args.Error(1)
}

func (m *mockCustomerRepo) FindById(customer *Customer, id string) error {
	args := m.Called(customer, id)
	return args.Error(0)
}

func (m *mockCustomerRepo) Save(customer *Customer) error {
	args := m.Called(customer)
	return args.Error(0)
}
func TestUseCase_Create(t *testing.T) {
	repo := new(mockCustomerRepo)
	usecase := NewUseCase(repo)

	customer := &Customer{
		Model:     gorm.Model{},
		FirstName: "customer",
		LastName:  "last",
		Email:     "customer@gmail.com",
		Avatar:    "customer.jpg",
	}
	repo.On("Save", customer).Return(nil)

	err := usecase.Create(customer)

	assert.NoError(t, err)
	repo.AssertExpectations(t)
}
func (m *mockCustomerRepo) Delete(customer *Customer) error {
	args := m.Called(customer)
	return args.Error(0)
}
func TestUseCase_Delete(t *testing.T) {
	repo := new(mockCustomerRepo)
	usecase := NewUseCase(repo)

	customer := &Customer{
		Email:     "Doe@mail.com",
		FirstName: "Doe",
		LastName:  "Joe",
		Avatar:    "Doe.img",
	}

	repo.On("Delete", customer).Return(nil)

	err := usecase.Delete(customer)

	assert.NoError(t, err)
	repo.AssertExpectations(t)
}
