/**
 * Represents the body of a rest request received from Chargify
 * via a webhook.
 *
 * @testclass   Test_ChargifyBody
 * @author      Luke
 * @date        Oct 2013
 */
public with sharing class ChargifyBody {
    public class ChargifyBody_Exception extends Exception {}

    private Map<String, String> bodyAsMap;
    public String bodyRaw { get; private set; }

	public ChargifyBody(Map<String, String> bodyAsMap) {
        this.bodyAsMap = bodyAsMap;
        this.bodyRaw = getRaw();
	}

    public ChargifyBody(String rawBody) {
        this.bodyRaw = rawBody;
    }

    private String getRaw() {
        if(this.bodyRaw != null) return this.bodyRaw;
        else {
            List<String> keyValTokens = new List<String>();  // Elements should be in format e.g. 'key=value'
            for(String key : expectedKeyOrder) {
                String value = bodyAsMap.get(key);
                if(value == null) {
                    keyValTokens.add(key + '=');
                } else {
                    keyValTokens.add(key + '=' + EncodingUtil.urlEncode(value, 'UTF-8').replace('+', '%20'));
                }
            }
            return String.join(keyValTokens, '&');
        }
    }

    public Boolean verifySignature(String siteKey, String signature) {
        String mySig = calculateSignature(siteKey, signature);
        return mySig == signature;
    }

    public String calculateSignature(String siteKey, String signature) {
        Blob mySigBlob  = Crypto.generateMac(
            'hmacSHA256', 
            Blob.valueOf(this.bodyRaw),
            Blob.valueOf(siteKey)
        );
        return EncodingUtil.convertToHex(mySigBlob);
    }

    private static final List<String> expectedKeyOrder = new List<String> {
        'id',
        'event',
        'payload[subscription][activated_at]',
        'payload[subscription][balance_in_cents]',
        'payload[subscription][cancel_at_end_of_period]',
        'payload[subscription][canceled_at]',
        'payload[subscription][cancellation_message]',
        'payload[subscription][created_at]',
        'payload[subscription][current_period_ends_at]',
        'payload[subscription][expires_at]',
        'payload[subscription][id]',
        'payload[subscription][next_assessment_at]',
        'payload[subscription][payment_collection_method]',
        'payload[subscription][state]',
        'payload[subscription][trial_ended_at]',
        'payload[subscription][trial_started_at]',
        'payload[subscription][updated_at]',
        'payload[subscription][current_period_started_at]',
        'payload[subscription][previous_state]',
        'payload[subscription][signup_payment_id]',
        'payload[subscription][signup_revenue]',
        'payload[subscription][delayed_cancel_at]',
        'payload[subscription][coupon_code]',
        'payload[subscription][total_revenue_in_cents]',
        'payload[subscription][customer][address]',
        'payload[subscription][customer][address_2]',
        'payload[subscription][customer][city]',
        'payload[subscription][customer][country]',
        'payload[subscription][customer][created_at]',
        'payload[subscription][customer][email]',
        'payload[subscription][customer][first_name]',
        'payload[subscription][customer][id]',
        'payload[subscription][customer][last_name]',
        'payload[subscription][customer][organization]',
        'payload[subscription][customer][phone]',
        'payload[subscription][customer][reference]',
        'payload[subscription][customer][state]',
        'payload[subscription][customer][updated_at]',
        'payload[subscription][customer][zip]',
        'payload[subscription][product][accounting_code]',
        'payload[subscription][product][archived_at]',
        'payload[subscription][product][created_at]',
        'payload[subscription][product][description]',
        'payload[subscription][product][expiration_interval]',
        'payload[subscription][product][expiration_interval_unit]',
        'payload[subscription][product][handle]',
        'payload[subscription][product][id]',
        'payload[subscription][product][initial_charge_in_cents]',
        'payload[subscription][product][interval]',
        'payload[subscription][product][interval_unit]',
        'payload[subscription][product][name]',
        'payload[subscription][product][price_in_cents]',
        'payload[subscription][product][request_credit_card]',
        'payload[subscription][product][require_credit_card]',
        'payload[subscription][product][return_params]',
        'payload[subscription][product][return_url]',
        'payload[subscription][product][trial_interval]',
        'payload[subscription][product][trial_interval_unit]',
        'payload[subscription][product][trial_price_in_cents]',
        'payload[subscription][product][update_return_url]',
        'payload[subscription][product][updated_at]',
        'payload[subscription][product][product_family][accounting_code]',
        'payload[subscription][product][product_family][description]',
        'payload[subscription][product][product_family][handle]',
        'payload[subscription][product][product_family][id]',
        'payload[subscription][product][product_family][name]',
        'payload[subscription][credit_card][billing_address]',
        'payload[subscription][credit_card][billing_address_2]',
        'payload[subscription][credit_card][billing_city]',
        'payload[subscription][credit_card][billing_country]',
        'payload[subscription][credit_card][billing_state]',
        'payload[subscription][credit_card][billing_zip]',
        'payload[subscription][credit_card][card_type]',
        'payload[subscription][credit_card][current_vault]',
        'payload[subscription][credit_card][customer_id]',
        'payload[subscription][credit_card][customer_vault_token]',
        'payload[subscription][credit_card][expiration_month]',
        'payload[subscription][credit_card][expiration_year]',
        'payload[subscription][credit_card][first_name]',
        'payload[subscription][credit_card][id]',
        'payload[subscription][credit_card][last_name]',
        'payload[subscription][credit_card][masked_card_number]',
        'payload[subscription][credit_card][vault_token]',
        'payload[transaction][amount_in_cents]',
        'payload[transaction][card_expiration]',
        'payload[transaction][card_number]',
        'payload[transaction][card_type]',
        'payload[transaction][component_id]',
        'payload[transaction][created_at]',
        'payload[transaction][ending_balance_in_cents]',
        'payload[transaction][id]',
        'payload[transaction][kind]',
        'payload[transaction][memo]',
        'payload[transaction][payment_id]',
        'payload[transaction][product_id]',
        'payload[transaction][starting_balance_in_cents]',
        'payload[transaction][subscription_id]',
        'payload[transaction][success]',
        'payload[transaction][tax_id]',
        'payload[transaction][type]',
        'payload[transaction][transaction_type]',
        'payload[transaction][gateway_transaction_id]',
        'payload[transaction][statement_id]',
        'payload[transaction][customer_id]',
        'payload[site][id]',
        'payload[site][subdomain]'
    };
}