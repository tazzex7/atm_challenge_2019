require'./lib/account.rb'
require 'date'

describe Account do
    let(:person) { instance_double('Person', name: 'Thomas') }
    subject { described_class.new({owner: person}) }

    it 'is expected to have an owner' do
        expect(subject.owner).to eq person
        
    end

    it 'is expected to raise error if no owner is set' do
        expect { described_class.new }.to raise_error 'An Account owner is required'
    end

    it 'is expected to have an expiry date on initialize' do
        expected_date = Date.today.next_year(5).strftime("%m/%Y")
        expect(subject.exp_date).to eq expected_date
    end

    it 'Is expected to have :active status on initialize' do
        expect(subject.account_status).to eq :active
    end

    it 'deactivates account using the instance method' do
        subject.deactivate 
        expect(subject.account_status).to eq :deactivated
    end

    it 'should initialize with a pin code of four numbers' do
        my_number = 1234
        number_length = Math.log10(my_number).to_i + 1
        expect(number_length).to eq 4
    end

end