package customers

type UseCase struct {
	repo RepositoryInterface
}

type UseCaseInterface interface {
	Create(customer *Customer) error
	GetAll(page int, email string) ([]Customer, error)
	Delete(customer *Customer) error
	FindById(customer *Customer, id string) error
}

func NewUseCase(repo RepositoryInterface) UseCaseInterface {
	return UseCase{
		repo: repo,
	}
}

func (u UseCase) Create(customer *Customer) error {
	return u.repo.Save(customer)
}

func (u UseCase) GetAll(page int, email string) ([]Customer, error) {
	return u.repo.GetAllCustomer(page, email)
}

func (u UseCase) Delete(customer *Customer) error {
	return u.repo.Delete(customer)
}

func (u UseCase) FindById(customer *Customer, id string) error {
	return u.repo.FindById(customer, id)
}
