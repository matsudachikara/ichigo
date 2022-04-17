# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateCustomerTierService do
  describe '#call' do

    around do |e|
      travel_to(Time.zone.local(2022, 1, 1, 0, 0, 0)) { e.run }
    end

    context 'when customer spent $0 last year' do
      let(:customer) { create(:customer) }

      it 'should create customer tier' do
        described_class.call(customer: customer)
        aggregate_failures do
          expect(customer.customer_tier.tier).to eq 'bronze'
          expect(customer.customer_tier.start_date).to eq Time.zone.local(2021, 1, 1, 0, 0, 0)
          expect(customer.customer_tier.dollars_spent_since_start).to eq 0
        end
      end
    end

    context 'when customer spent $10 last year' do
      let(:customer) {
        create(
          :customer,
          :with_completed_orders,
          completed_order_count: 1,
          total_in_cents: 1000,
          order_date: Time.zone.local(2021, 1, 1, 0, 0, 0)
        )
      }

      it 'should create customer tier with bronze' do
        described_class.call(customer: customer)
        aggregate_failures do
          expect(customer.customer_tier.tier).to eq 'bronze'
          expect(customer.customer_tier.start_date).to eq Time.zone.local(2021, 1, 1, 0, 0, 0)
          expect(customer.customer_tier.dollars_spent_since_start).to eq 10
        end
      end
    end

    context 'when customer spent $100 last year' do
      let(:customer) {
        create(
          :customer,
          :with_completed_orders,
          completed_order_count: 1,
          total_in_cents: 10000,
          order_date: Time.zone.local(2021, 12, 31, 23, 59, 59)
        )
      }

      it 'should create customer tier with silver' do
        described_class.call(customer: customer)
        aggregate_failures do
          expect(customer.customer_tier.tier).to eq 'silver'
          expect(customer.customer_tier.start_date).to eq Time.zone.local(2021, 1, 1, 0, 0, 0)
          expect(customer.customer_tier.dollars_spent_since_start).to eq 100
        end
      end
    end

    context 'when customer spent $500 last year' do
      let(:customer) {
        create(
          :customer,
          :with_completed_orders,
          completed_order_count: 1,
          total_in_cents: 50000,
          order_date: Time.zone.local(2021, 12, 31, 23, 59, 59)
        )
      }

      it 'should create customer tier with gold' do
        described_class.call(customer: customer)
        aggregate_failures do
          expect(customer.customer_tier.tier).to eq 'gold'
          expect(customer.customer_tier.start_date).to eq Time.zone.local(2021, 1, 1, 0, 0, 0)
          expect(customer.customer_tier.dollars_spent_since_start).to eq 500
        end
      end
    end

    context 'when customer spent $100 in total last year' do
      let(:customer) {
        create(
          :customer,
          :with_completed_orders,
          completed_order_count: 2,
          total_in_cents: 5000,
          order_date: Time.zone.local(2021, 12, 31, 23, 59, 59)
        )
      }

      it 'should create customer tier with silver' do
        described_class.call(customer: customer)
        aggregate_failures do
          expect(customer.customer_tier.tier).to eq 'silver'
          expect(customer.customer_tier.start_date).to eq Time.zone.local(2021, 1, 1, 0, 0, 0)
          expect(customer.customer_tier.dollars_spent_since_start).to eq 100
        end
      end
    end

    context 'when customer spent $500 in total last year' do
      let(:customer) {
        create(
          :customer,
          :with_completed_orders,
          completed_order_count: 5,
          total_in_cents: 10000,
          order_date: Time.zone.local(2021, 12, 31, 23, 59, 59)
        )
      }

      it 'should create customer tier with gold' do
        described_class.call(customer: customer)
        aggregate_failures do
          expect(customer.customer_tier.tier).to eq 'gold'
          expect(customer.customer_tier.start_date).to eq Time.zone.local(2021, 1, 1, 0, 0, 0)
          expect(customer.customer_tier.dollars_spent_since_start).to eq 500
        end
      end
    end

  end
end
