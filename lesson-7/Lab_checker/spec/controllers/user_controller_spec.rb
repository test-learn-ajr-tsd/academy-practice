require 'rails_helper'

RSpec.describe UsersController, type: :controller do 
	render_views
	let!(:users) { create_list :user, 5 }
	let(:user) {create :user }
	let(:user_params) do
		{
		user: {
			first_name: 'Иван',
			last_name: 'Иванов',
			email: 'ivanivanov@test.ru'
		}}
	end

	context 'GET #index' do		
		before { get :index }

		it 'returns items' do
			expect(assigns(:users)).to match_array(users)
		end

		it 'is render template' do
			is_expected.to render_template :index
		end
	end

	context 'GET #new' do
		subject { get :new }
   		
      	it 'Render the new page' do
        	expect(subject).to render_template(:new)
      	end    
	end


	context 'GET #show' do
		subject { get :show, params: {id: user.id} }
		let!(:user) {create :user }
		it 'render show' do
			 #get user_path(user.id)
			expect(subject).to render_template(:show) 
		end
	end	

	context 'POST #create' do 
		subject { post :create, params: user_params}

		it 'saves the User' do
			expect { subject }.to change(User, :count).by 1
		end

		context 'POST #create - invalid params' do 
			let(:user_params) do 
				{user: {
					first_name: 'Иван',
					last_name: 'Иванов',
					email: '12'}}
			end
			subject { post :create, params: user_params}

			it 'saves the User' do
				expect { subject }.to_not change(User, :count)				
			end
		end	
	end

	context 'PATCH #update' do
		let(:params) do {
			first_name: 'Иван',
			last_name: 'Иванов',
		} end		

		it 'update fiels' do
			user.update(params)			
			user.reload
			expect(user.first_name).to eq 'Иван'
		end
	end		

	context 'POST #delete' do
		subject { delete :destroy, params: {id: user.id} }

		it 'delete from User' do
			user.reload
			expect { subject }.to change(User, :count).by(-1)
		end

		it 'render index template' do
			is_expected.to redirect_to action: :index
		end		
	end	

	context 'Redirecting' do

	end

end