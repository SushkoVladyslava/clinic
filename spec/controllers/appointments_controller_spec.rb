# frozen_string_literal: true

require 'rails_helper'

describe AppointmentsController do
  before { sign_in user}

  let(:user) { create(:user) }
  let(:appointment) { create(:appointment) }

  # let(:content_topic_ids) { create_list(:content_topic, 5).pluck(:id) }
  # let(:newsletter_content_tag_ids) { create_list(:newsletter_content_tag, 1).pluck(:id) }
  # let(:vertical) { create(:vertical) }

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

      it 'does not create vertical' do
        binding.pry
        expect { subject }.not_to(change { Appointment.count })
      end
    end
  end
end
