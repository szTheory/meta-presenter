require 'spec_helper'

describe MetaPresenter::Helpers do
  let(:controller_class) { ApplicationController }
  let(:controller) { controller_class.new }
  let(:action_name) { 'logs' }

  describe '#presenter' do
    subject { controller.view_context.presenter }

    before do
      allow(controller).to receive(:action_name).and_return(action_name)
    end

    context "controller with this module included" do
      before do
        expect(controller_class.included_modules).to include(described_class)
      end

      it { is_expected.to be_a(ApplicationPresenter) }
    end
  end
end