require 'rails_helper'

RSpec.describe LabReportsController, type: :controller do 
	let(:user) { create :user}
	render_views	
	let!(:lab_reports) { create_list :lab_report, 5 }
	let(:lab_report) {create :lab_report, user: user }

	context 'GET #index' do		
		before { get :index }

		it 'returns items' do
			expect(assigns(:lab_reports)).to match_array(lab_reports)
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
		subject { get :show, params: {id: lab_report.id} }
		let!(:lab_report) {create :lab_report }
		it 'render show' do
			 #get user_path(user.id)
			expect(subject).to render_template(:show) 
		end
	end	

	context 'POST #create' do
		let!(:user) { create(:user) }
		let(:lab_report_params) { { lab_report: { title: 'Rails application', description: 'Laboratory reports', grade: 'None', user_id: user.id } } }
		subject { post :create, params: lab_report_params}

		it 'saves the LabReport' do
			expect { subject }.to change(LabReport, :count).by 1			
		end

		context 'POST #create - invalid params' do 
			let(:lab_report_params) { { lab_report: { grade: 'Rails application', description: 'Laboratory reports', title: 'labs', user_id: user.id } } }
			subject { post :create, params: lab_report_params}

			it 'NOT saves the Lab report' do
				expect { subject }.to_not change(LabReport, :count)
			end
		end	
	end

	context 'POST #update' do
		let(:params) do {
			title: 'ТестЗаголовок',
			description: 'Описание',
		} end		

		it 'update fiels' do
			lab_report.update(params)
			lab_report.reload
			expect(lab_report.title).to eq 'ТестЗаголовок'			
		end
	end	

	context 'POST #delete' do
		subject { delete :destroy, params: {id: lab_report.id} }

		it 'delete from Lab_report' do
			lab_report.reload
			expect { subject }.to change(LabReport, :count).by(-1)
		end

		it 'render index template' do
			is_expected.to redirect_to action: :index
		end		
	end		
end