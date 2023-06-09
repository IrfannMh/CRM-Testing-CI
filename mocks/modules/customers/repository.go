// Code generated by mockery v2.20.0. DO NOT EDIT.

package mocks

import (
	customers "CRM/modules/customers"

	mock "github.com/stretchr/testify/mock"
)

// Repository is an autogenerated mock type for the Repository type
type Repository struct {
	mock.Mock
}

type Repository_Expecter struct {
	mock *mock.Mock
}

func (_m *Repository) EXPECT() *Repository_Expecter {
	return &Repository_Expecter{mock: &_m.Mock}
}

// Save provides a mock function with given fields: customer
func (_m *Repository) Save(customer *customers.Customer) error {
	ret := _m.Called(customer)

	var r0 error
	if rf, ok := ret.Get(0).(func(*customers.Customer) error); ok {
		r0 = rf(customer)
	} else {
		r0 = ret.Error(0)
	}

	return r0
}

// Repository_Save_Call is a *mock.Call that shadows Run/Return methods with type explicit version for method 'Save'
type Repository_Save_Call struct {
	*mock.Call
}

// Save is a helper method to define mock.On call
//   - customer *customers.Customer
func (_e *Repository_Expecter) Save(customer interface{}) *Repository_Save_Call {
	return &Repository_Save_Call{Call: _e.mock.On("Save", customer)}
}

func (_c *Repository_Save_Call) Run(run func(customer *customers.Customer)) *Repository_Save_Call {
	_c.Call.Run(func(args mock.Arguments) {
		run(args[0].(*customers.Customer))
	})
	return _c
}

func (_c *Repository_Save_Call) Return(_a0 error) *Repository_Save_Call {
	_c.Call.Return(_a0)
	return _c
}

func (_c *Repository_Save_Call) RunAndReturn(run func(*customers.Customer) error) *Repository_Save_Call {
	_c.Call.Return(run)
	return _c
}

type mockConstructorTestingTNewRepository interface {
	mock.TestingT
	Cleanup(func())
}

// NewRepository creates a new instance of Repository. It also registers a testing interface on the mock and a cleanup function to assert the mocks expectations.
func NewRepository(t mockConstructorTestingTNewRepository) *Repository {
	mock := &Repository{}
	mock.Mock.Test(t)

	t.Cleanup(func() { mock.AssertExpectations(t) })

	return mock
}
