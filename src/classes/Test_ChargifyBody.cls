/**
 * Unit tests for ChargifyBody Apex class.
 *
 * @author  Luke
 * @date    Oct 2013
 */
@isTest global class Test_ChargifyBody {
    /**
     * Test deserializing a serialized body from chargify and assert
     * that we get the expected raw body as a result.
     */
    @isTest static void positiveTest1() {
        Map<String, String> bodyAsMap = new Map<String, String> {
            'payload[transaction][statement_id]' => '24384227',
            'payload[subscription][product][trial_interval_unit]' => 'month',
            'payload[subscription][customer][address]' => '',
            'payload[subscription][credit_card][billing_country]' => '',
            'payload[subscription][customer][reference]' => '',
            'payload[subscription][product][trial_interval]' => '',
            'payload[subscription][credit_card][billing_zip]' => '',
            'payload[subscription][product][product_family][handle]' => 'cloud-software',
            'payload[transaction][starting_balance_in_cents]' => '0',
            'payload[subscription][product][request_credit_card]' => 'true',
            'payload[subscription][product][handle]' => 'cloud-automate',
            'payload[subscription][credit_card][card_type]' => 'bogus',
            'payload[subscription][credit_card][last_name]' => 'McKnight',
            'payload[transaction][amount_in_cents]' => '100',
            'payload[subscription][customer][zip]' => '',
            'payload[subscription][product][archived_at]' => '',
            'payload[subscription][expires_at]' => '',
            'payload[transaction][created_at]' => '2013-10-30 21:26:36 -0400',
            'payload[subscription][customer][email]' => 'frank.mcknight@trineo.co.nz.demo',
            'payload[subscription][credit_card][expiration_year]' => '2016',
            'payload[transaction][ending_balance_in_cents]' => '0',
            'payload[transaction][component_id]' => '',
            'payload[site][id]' => '17545',
            'payload[subscription][customer][state]' => 'CA',
            'payload[subscription][credit_card][masked_card_number]' => 'XXXX-XXXX-XXXX-2',
            'payload[subscription][trial_started_at]' => '',
            'payload[subscription][product][product_family][description]' => '',
            'payload[transaction][gateway_transaction_id]' => '',
            'event' => 'payment_failure',
            'payload[subscription][coupon_code]' => '',
            'payload[subscription][signup_payment_id]' => '41499410',
            'payload[subscription][credit_card][expiration_month]' => '1',
            'payload[subscription][balance_in_cents]' => '0',
            'payload[subscription][product][id]' => '3347502',
            'payload[subscription][customer][first_name]' => 'Frank',
            'payload[subscription][total_revenue_in_cents]' => '6099',
            'payload[transaction][payment_id]' => '',
            'payload[subscription][product][price_in_cents]' => '5999',
            'payload[subscription][previous_state]' => 'active',
            'payload[subscription][id]' => '4038637',
            'payload[subscription][customer][updated_at]' => '2013-10-16 03:45:43 -0400',
            'payload[subscription][cancel_at_end_of_period]' => 'false',
            'payload[subscription][product][return_url]' => '',
            'payload[subscription][product][created_at]' => '2013-10-16 03:47:47 -0400',
            'payload[transaction][memo]' => 'Bogus Gateway: Forced failure',
            'payload[subscription][customer][address_2]' => null,
            'payload[transaction][transaction_type]' => 'payment',
            'payload[subscription][cancellation_message]' => '',
            'payload[transaction][id]' => '42382743',
            'payload[subscription][product][return_params]' => '',
            'payload[subscription][product][interval]' => '1',
            'payload[transaction][card_number]' => 'XXXX-XXXX-XXXX-2',
            'payload[subscription][product][expiration_interval]' => '',
            'payload[transaction][tax_id]' => '',
            'payload[subscription][activated_at]' => '2013-10-16 03:48:40 -0400',
            'payload[transaction][kind]' => 'one_time',
            'payload[site][subdomain]' => 'vcg-demo',
            'payload[subscription][product][accounting_code]' => '',
            'payload[subscription][product][update_return_url]' => '',
            'payload[transaction][success]' => 'false',
            'payload[subscription][signup_revenue]' => '59.99',
            'id' => '14270862',
            'payload[subscription][credit_card][first_name]' => 'Frank',
            'payload[subscription][credit_card][id]' => '2463134',
            'payload[subscription][next_assessment_at]' => '2013-11-16 02:48:38 -0500',
            'payload[subscription][credit_card][billing_state]' => '',
            'payload[subscription][credit_card][current_vault]' => 'bogus',
            'payload[transaction][type]' => 'Payment',
            'payload[subscription][updated_at]' => '2013-10-30 21:26:36 -0400',
            'payload[subscription][customer][phone]' => '',
            'payload[subscription][credit_card][customer_vault_token]' => '',
            'payload[subscription][product][interval_unit]' => 'month',
            'payload[subscription][credit_card][vault_token]' => '2',
            'payload[subscription][credit_card][billing_address]' => '',
            'payload[subscription][current_period_started_at]' => '2013-10-16 03:48:38 -0400',
            'payload[subscription][product][expiration_interval_unit]' => 'never',
            'payload[subscription][created_at]' => '2013-10-16 03:48:38 -0400',
            'payload[subscription][product][initial_charge_in_cents]' => '',
            'payload[subscription][trial_ended_at]' => '',
            'payload[subscription][credit_card][billing_address_2]' => null,
            'payload[transaction][subscription_id]' => '4038637',
            'payload[subscription][canceled_at]' => '',
            'payload[subscription][credit_card][billing_city]' => '',
            'payload[subscription][credit_card][customer_id]' => '3903223',
            'payload[subscription][customer][id]' => '3903223',
            'payload[subscription][product][product_family][accounting_code]' => '',
            'payload[transaction][customer_id]' => '3903223',
            'payload[subscription][customer][organization]' => '',
            'payload[subscription][product][updated_at]' => '2013-10-16 03:47:47 -0400',
            'payload[subscription][product][trial_price_in_cents]' => '',
            'payload[subscription][product][product_family][id]' => '363844',
            'payload[transaction][card_type]' => 'bogus',
            'payload[subscription][product][name]' => 'Cloud Automate',
            'payload[transaction][card_expiration]' => '01/2016',
            'payload[subscription][customer][created_at]' => '2013-10-16 03:45:43 -0400',
            'payload[subscription][customer][city]' => 'San Francisco',
            'payload[subscription][delayed_cancel_at]' => '',
            'payload[subscription][state]' => 'active',
            'payload[subscription][customer][last_name]' => 'McKnight',
            'payload[subscription][current_period_ends_at]' => '2013-11-16 02:48:38 -0500',
            'payload[subscription][customer][country]' => 'US',
            'payload[subscription][payment_collection_method]' => 'automatic',
            'payload[transaction][product_id]' => '3347502',
            'payload[subscription][product][description]' => '',
            'payload[subscription][product][require_credit_card]' => 'true',
            'payload[subscription][product][product_family][name]' => 'Cloud Software'
        };

        ChargifyBody chargifyBody = new ChargifyBody(bodyAsMap);

        String expectedRawBody = 'id=14270862&event=payment_failure&payload[subscription][activated_at]=2013-10-16%2003%3A48%3A40%20-0400&payload[subscription][balance_in_cents]';
        expectedRawBody += '=0&payload[subscription][cancel_at_end_of_period]=false&payload[subscription][canceled_at]=&payload[subscription][cancellation_message]=&payload[subscription][created_at';
        expectedRawBody += ']=2013-10-16%2003%3A48%3A38%20-0400&payload[subscription][current_period_ends_at]=2013-11-16%2002%3A48%3A38%20-0500&payload[subscription][expires_at]=&payload[subscripti';
        expectedRawBody += 'on][id]=4038637&payload[subscription][next_assessment_at]=2013-11-16%2002%3A48%3A38%20-0500&payload[subscription][payment_collection_method]=automatic&payload[subscripti';
        expectedRawBody += 'on][state]=active&payload[subscription][trial_ended_at]=&payload[subscription][trial_started_at]=&payload[subscription][updated_at]=2013-10-30%2021%3A26%3A36%20-0400&pay';
        expectedRawBody += 'load[subscription][current_period_started_at]=2013-10-16%2003%3A48%3A38%20-0400&payload[subscription][previous_state]=active&payload[subscription][signup_payment_id]=414';
        expectedRawBody += '99410&payload[subscription][signup_revenue]=59.99&payload[subscription][delayed_cancel_at]=&payload[subscription][coupon_code]=&payload[subscription][total_revenue_in_ce';
        expectedRawBody += 'nts]=6099&payload[subscription][customer][address]=&payload[subscription][customer][address_2]=&payload[subscription][customer][city]=San%20Francisco&payload[subscriptio';
        expectedRawBody += 'n][customer][country]=US&payload[subscription][customer][created_at]=2013-10-16%2003%3A45%3A43%20-0400&payload[subscription][customer][email]=frank.mcknight%40trineo.co.';
        expectedRawBody += 'nz.demo&payload[subscription][customer][first_name]=Frank&payload[subscription][customer][id]=3903223&payload[subscription][customer][last_name]=McKnight&payload[subscri';
        expectedRawBody += 'ption][customer][organization]=&payload[subscription][customer][phone]=&payload[subscription][customer][reference]=&payload[subscription][customer][state]=CA&payload[sub';
        expectedRawBody += 'scription][customer][updated_at]=2013-10-16%2003%3A45%3A43%20-0400&payload[subscription][customer][zip]=&payload[subscription][product][accounting_code]=&payload[subscri';
        expectedRawBody += 'ption][product][archived_at]=&payload[subscription][product][created_at]=2013-10-16%2003%3A47%3A47%20-0400&payload[subscription][product][description]=&payload[subscript';
        expectedRawBody += 'ion][product][expiration_interval]=&payload[subscription][product][expiration_interval_unit]=never&payload[subscription][product][handle]=cloud-automate&payload[subscrip';
        expectedRawBody += 'tion][product][id]=3347502&payload[subscription][product][initial_charge_in_cents]=&payload[subscription][product][interval]=1&payload[subscription][product][interval_un';
        expectedRawBody += 'it]=month&payload[subscription][product][name]=Cloud%20Automate&payload[subscription][product][price_in_cents]=5999&payload[subscription][product][request_credit_card]=t';
        expectedRawBody += 'rue&payload[subscription][product][require_credit_card]=true&payload[subscription][product][return_params]=&payload[subscription][product][return_url]=&payload[subscript';
        expectedRawBody += 'ion][product][trial_interval]=&payload[subscription][product][trial_interval_unit]=month&payload[subscription][product][trial_price_in_cents]=&payload[subscription][prod';
        expectedRawBody += 'uct][update_return_url]=&payload[subscription][product][updated_at]=2013-10-16%2003%3A47%3A47%20-0400&payload[subscription][product][product_family][accounting_code]=&pa';
        expectedRawBody += 'yload[subscription][product][product_family][description]=&payload[subscription][product][product_family][handle]=cloud-software&payload[subscription][product][product_f';
        expectedRawBody += 'amily][id]=363844&payload[subscription][product][product_family][name]=Cloud%20Software&payload[subscription][credit_card][billing_address]=&payload[subscription][credit';
        expectedRawBody += '_card][billing_address_2]=&payload[subscription][credit_card][billing_city]=&payload[subscription][credit_card][billing_country]=&payload[subscription][credit_card][bill';
        expectedRawBody += 'ing_state]=&payload[subscription][credit_card][billing_zip]=&payload[subscription][credit_card][card_type]=bogus&payload[subscription][credit_card][current_vault]=bogus&';
        expectedRawBody += 'payload[subscription][credit_card][customer_id]=3903223&payload[subscription][credit_card][customer_vault_token]=&payload[subscription][credit_card][expiration_month]=1&';
        expectedRawBody += 'payload[subscription][credit_card][expiration_year]=2016&payload[subscription][credit_card][first_name]=Frank&payload[subscription][credit_card][id]=2463134&payload[subs';
        expectedRawBody += 'cription][credit_card][last_name]=McKnight&payload[subscription][credit_card][masked_card_number]=XXXX-XXXX-XXXX-2&payload[subscription][credit_card][vault_token]=2&payl';
        expectedRawBody += 'oad[transaction][amount_in_cents]=100&payload[transaction][card_expiration]=01%2F2016&payload[transaction][card_number]=XXXX-XXXX-XXXX-2&payload[transaction][card_type]=';
        expectedRawBody += 'bogus&payload[transaction][component_id]=&payload[transaction][created_at]=2013-10-30%2021%3A26%3A36%20-0400&payload[transaction][ending_balance_in_cents]=0&payload[tran';
        expectedRawBody += 'saction][id]=42382743&payload[transaction][kind]=one_time&payload[transaction][memo]=Bogus%20Gateway%3A%20Forced%20failure&payload[transaction][payment_id]=&payload[tran';
        expectedRawBody += 'saction][product_id]=3347502&payload[transaction][starting_balance_in_cents]=0&payload[transaction][subscription_id]=4038637&payload[transaction][success]=false&payload[';
        expectedRawBody += 'transaction][tax_id]=&payload[transaction][type]=Payment&payload[transaction][transaction_type]=payment&payload[transaction][gateway_transaction_id]=&payload[transaction';
        expectedRawBody += '][statement_id]=24384227&payload[transaction][customer_id]=3903223&payload[site][id]=17545&payload[site][subdomain]=vcg-demo';

        System.assertEquals(expectedRawBody, chargifyBody.bodyRaw, 'Returned raw body does not match expected raw body');
    }


    @isTest static void testVerifySignature() {
       Map<String, String> bodyAsMap = new Map<String, String> {
            'payload[transaction][statement_id]' => '24384227',
            'payload[subscription][product][trial_interval_unit]' => 'month',
            'payload[subscription][customer][address]' => '',
            'payload[subscription][credit_card][billing_country]' => '',
            'payload[subscription][customer][reference]' => '',
            'payload[subscription][product][trial_interval]' => '',
            'payload[subscription][credit_card][billing_zip]' => '',
            'payload[subscription][product][product_family][handle]' => 'cloud-software',
            'payload[transaction][starting_balance_in_cents]' => '0',
            'payload[subscription][product][request_credit_card]' => 'true',
            'payload[subscription][product][handle]' => 'cloud-automate',
            'payload[subscription][credit_card][card_type]' => 'bogus',
            'payload[subscription][credit_card][last_name]' => 'McKnight',
            'payload[transaction][amount_in_cents]' => '100',
            'payload[subscription][customer][zip]' => '',
            'payload[subscription][product][archived_at]' => '',
            'payload[subscription][expires_at]' => '',
            'payload[transaction][created_at]' => '2013-10-30 21:26:36 -0400',
            'payload[subscription][customer][email]' => 'frank.mcknight@trineo.co.nz.demo',
            'payload[subscription][credit_card][expiration_year]' => '2016',
            'payload[transaction][ending_balance_in_cents]' => '0',
            'payload[transaction][component_id]' => '',
            'payload[site][id]' => '17545',
            'payload[subscription][customer][state]' => 'CA',
            'payload[subscription][credit_card][masked_card_number]' => 'XXXX-XXXX-XXXX-2',
            'payload[subscription][trial_started_at]' => '',
            'payload[subscription][product][product_family][description]' => '',
            'payload[transaction][gateway_transaction_id]' => '',
            'event' => 'payment_failure',
            'payload[subscription][coupon_code]' => '',
            'payload[subscription][signup_payment_id]' => '41499410',
            'payload[subscription][credit_card][expiration_month]' => '1',
            'payload[subscription][balance_in_cents]' => '0',
            'payload[subscription][product][id]' => '3347502',
            'payload[subscription][customer][first_name]' => 'Frank',
            'payload[subscription][total_revenue_in_cents]' => '6099',
            'payload[transaction][payment_id]' => '',
            'payload[subscription][product][price_in_cents]' => '5999',
            'payload[subscription][previous_state]' => 'active',
            'payload[subscription][id]' => '4038637',
            'payload[subscription][customer][updated_at]' => '2013-10-16 03:45:43 -0400',
            'payload[subscription][cancel_at_end_of_period]' => 'false',
            'payload[subscription][product][return_url]' => '',
            'payload[subscription][product][created_at]' => '2013-10-16 03:47:47 -0400',
            'payload[transaction][memo]' => 'Bogus Gateway: Forced failure',
            'payload[subscription][customer][address_2]' => null,
            'payload[transaction][transaction_type]' => 'payment',
            'payload[subscription][cancellation_message]' => '',
            'payload[transaction][id]' => '42382743',
            'payload[subscription][product][return_params]' => '',
            'payload[subscription][product][interval]' => '1',
            'payload[transaction][card_number]' => 'XXXX-XXXX-XXXX-2',
            'payload[subscription][product][expiration_interval]' => '',
            'payload[transaction][tax_id]' => '',
            'payload[subscription][activated_at]' => '2013-10-16 03:48:40 -0400',
            'payload[transaction][kind]' => 'one_time',
            'payload[site][subdomain]' => 'vcg-demo',
            'payload[subscription][product][accounting_code]' => '',
            'payload[subscription][product][update_return_url]' => '',
            'payload[transaction][success]' => 'false',
            'payload[subscription][signup_revenue]' => '59.99',
            'id' => '14270862',
            'payload[subscription][credit_card][first_name]' => 'Frank',
            'payload[subscription][credit_card][id]' => '2463134',
            'payload[subscription][next_assessment_at]' => '2013-11-16 02:48:38 -0500',
            'payload[subscription][credit_card][billing_state]' => '',
            'payload[subscription][credit_card][current_vault]' => 'bogus',
            'payload[transaction][type]' => 'Payment',
            'payload[subscription][updated_at]' => '2013-10-30 21:26:36 -0400',
            'payload[subscription][customer][phone]' => '',
            'payload[subscription][credit_card][customer_vault_token]' => '',
            'payload[subscription][product][interval_unit]' => 'month',
            'payload[subscription][credit_card][vault_token]' => '2',
            'payload[subscription][credit_card][billing_address]' => '',
            'payload[subscription][current_period_started_at]' => '2013-10-16 03:48:38 -0400',
            'payload[subscription][product][expiration_interval_unit]' => 'never',
            'payload[subscription][created_at]' => '2013-10-16 03:48:38 -0400',
            'payload[subscription][product][initial_charge_in_cents]' => '',
            'payload[subscription][trial_ended_at]' => '',
            'payload[subscription][credit_card][billing_address_2]' => null,
            'payload[transaction][subscription_id]' => '4038637',
            'payload[subscription][canceled_at]' => '',
            'payload[subscription][credit_card][billing_city]' => '',
            'payload[subscription][credit_card][customer_id]' => '3903223',
            'payload[subscription][customer][id]' => '3903223',
            'payload[subscription][product][product_family][accounting_code]' => '',
            'payload[transaction][customer_id]' => '3903223',
            'payload[subscription][customer][organization]' => '',
            'payload[subscription][product][updated_at]' => '2013-10-16 03:47:47 -0400',
            'payload[subscription][product][trial_price_in_cents]' => '',
            'payload[subscription][product][product_family][id]' => '363844',
            'payload[transaction][card_type]' => 'bogus',
            'payload[subscription][product][name]' => 'Cloud Automate',
            'payload[transaction][card_expiration]' => '01/2016',
            'payload[subscription][customer][created_at]' => '2013-10-16 03:45:43 -0400',
            'payload[subscription][customer][city]' => 'San Francisco',
            'payload[subscription][delayed_cancel_at]' => '',
            'payload[subscription][state]' => 'active',
            'payload[subscription][customer][last_name]' => 'McKnight',
            'payload[subscription][current_period_ends_at]' => '2013-11-16 02:48:38 -0500',
            'payload[subscription][customer][country]' => 'US',
            'payload[subscription][payment_collection_method]' => 'automatic',
            'payload[transaction][product_id]' => '3347502',
            'payload[subscription][product][description]' => '',
            'payload[subscription][product][require_credit_card]' => 'true',
            'payload[subscription][product][product_family][name]' => 'Cloud Software'
        };

        ChargifyBody chargifyBody = new ChargifyBody(bodyAsMap);
        String siteKey = 'x7x82snTo7lCgy7DhsI';
        String expectedSig = '15511ac0a58da0a087d6859cc06e8ce283ee16929fe04196210d69573e9dc24a';
        System.assertEquals('15511ac0a58da0a087d6859cc06e8ce283ee16929fe04196210d69573e9dc24a', chargifyBody.calculateSignature(siteKey), 'Incorrect calculated signature');
        System.assertEquals(true, chargifyBody.verifySignature(siteKey, expectedSig), 'Expecting signature verification to be successful');
    }
}