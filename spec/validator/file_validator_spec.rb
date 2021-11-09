# frozen_string_literal: true

require 'validator/file_validator'
require 'validator/errors/empty_file_error'
require 'validator/errors/no_file_error'
require 'validator/errors/not_a_log_error'

RSpec.describe Validator::FileValidator do
  let(:subject) { described_class.new(file_path) }

  describe '#validate_file' do
    context 'when the file is valid' do
      let(:file_path) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.log') }

      it 'does not raise any error' do
        expect { subject.validate_file }.not_to raise_error
      end
    end

    context 'when the path is invalid' do
      let(:file_path) { 'invalid_path' }

      it 'raises NoFileError' do
        expect { subject.validate_file }.to raise_error(NoFileError)
      end
    end

    context 'when the file is not a log' do
      let(:file_path) { File.join(Dir.pwd, 'spec', 'fixtures', 'webserver.rb') }

      it 'raises NotALogError' do
        expect { subject.validate_file }.to raise_error(NotALogError)
      end
    end

    context 'when the file is empty' do
      let(:file_path) { File.join(Dir.pwd, 'spec', 'fixtures', 'empty.log') }

      it 'raises EmptyFileError' do
        expect { subject.validate_file }.to raise_error(EmptyFileError)
      end
    end
  end
end
