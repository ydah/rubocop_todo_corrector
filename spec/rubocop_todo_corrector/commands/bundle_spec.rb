# frozen_string_literal: true

RSpec.describe RubocopTodoCorrector::Commands::Bundle do
  describe '#call' do
    subject do
      instance.call
    end

    let(:instance) do
      described_class.new(
        configuration_path: 'spec/fixtures/dummy_rubocop.yml',
        gemfile_lock_path: 'spec/fixtures/dummy_gemfile.lock',
        temporary_gemfile_path: 'tmp/Gemfile_rubocop_todo_corrector.rb'
      )
    end

    before do
      allow(Kernel).to receive(:system)
    end

    it 'install gems' do
      subject
      expect(Kernel).to have_received(:system).with(
        'bundle install --gemfile="tmp/Gemfile_rubocop_todo_corrector.rb"'
      )
    end
  end
end
