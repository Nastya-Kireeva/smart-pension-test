# frozen_string_literal: true

require 'runner'

RSpec.describe Runner do
  subject { described_class.new(file_path) }

  let(:expected_result) do
    <<~STRING
      Most page views:
      /help_page/1 - 5 page views
      /contact - 3 page views
      /home - 3 page views
      /about/2 - 2 page views
      /about - 2 page views
      /index - 1 page views

      Most unique page views:
      /help_page/1 - 5 unique page views
      /home - 3 unique page views
      /contact - 2 unique page views
      /about - 2 unique page views
      /about/2 - 1 unique page views
      /index - 1 unique page views
    STRING
  end

  describe '#run_logs_filtering' do
    context 'when the file is valid' do
      let(:file_path) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.log') }

      it 'prints filtered logs' do
        expect { subject.run_logs_filtering }.to output(expected_result).to_stdout
      end
    end

    context 'when the file is not valid' do
      context 'when the file is empty' do
        let(:file_path) { File.join(Dir.pwd, 'spec', 'fixtures', 'empty.log') }

        it 'raises EmptyFileError' do
          expect { subject.run_logs_filtering }.to raise_error(EmptyFileError)
        end
      end

      context 'when the file is not a log' do
        let(:file_path) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.rb') }

        it 'raises NotALogError' do
          expect { subject.run_logs_filtering }.to raise_error(NotALogError)
        end
      end

      context 'when the path is invalid' do
        let(:file_path) { 'invalid_path' }

        it 'raises NoFileError error' do
          expect { subject.run_logs_filtering }.to raise_error(NoFileError)
        end
      end
    end
  end
end
