# frozen_string_literal: true

require 'rails_helper'

describe AppointmentsController do
  before { sign_in user}

  let(:user) { create(:user) }
  let(:appointment) { create(:appointment) }

  describe 'POST create' do
    subject { post :create, params: params }

    context 'when params valid' do
      let!(:params) do
        { appointment: FactoryBot.build(:appointment).attributes }
      end

      it 'creates appointment' do
        expect { subject }.to change { Appointment.count }.by(1)
      end
    end

    context 'when params invalid' do
      let(:params) { { appointment: build(:appointment, :invalid_appointment).attributes } }

      it 'does not create appointment' do
        expect { subject }.not_to(change { Appointment.count })
      end
    end
  end
end
