class EmployeesController < ApplicationController

    def index 
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
        @dog_name = @employee.dog.name
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        @employee = Employee.create(employee_params)

        if @employee.save
            redirect_to employee_path(@employee)
        else
            render :new
        end
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def update
        @employee = Employee.find(params[:id])
        @dogs = Dog.all

        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            render :edit
        end

        # @employee = Employee.update(employee_params)
        # redirect_to employee_path(@employee)
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end

end
