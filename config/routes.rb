Rails.application.routes.draw do
  resources :lecturers
  resources :teachers
  resources :cities
  resources :countries
  root 'welcome#index'

  resources :student_grades
  resources :lectures
  resources :students
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'good_students' => 'students#good_students'
  get 'passed_students' => 'students#passed_students'
  get 'query_interfaces' => 'query_interfaces#index'
  get 'hash_conditions' => 'hash_conditions#index'

end
