#!/bin/bash

# source: https://github.com/PwnC00re/AllApiChecker

# Join Us! : Pwncore.co


function usage() {
    echo
    echo
    echo "X-Script By @Pwnsec: Pwncore.co"
    echo
    echo "Usage: $o <mod> <secrets..."
    echo
    echo "Supported mods are:"
    echo "  - algolia_api_key"
    echo "  - asana_access_token"
    echo "  - aws_secret"
    echo "  - azure_tenant"
    echo "  - bitly_access_token"
    echo "  - branchio_secret"
    echo "  - browserstack_access_key"
    echo "  - buildkite_access_token"
    echo "  - comcast_access_token"
    echo "  - datadog_api_key"
    echo "  - deviantart_secret"
    echo "  - deviantart_access_token"
    echo "  - dropbox_api_token"
    echo "  - facebook_appsecret"
    echo "  - facebook_access_token"
    echo "  - firebase_custom_token"
    echo "  - firebase_id_token"
    echo "  - github_client"
    echo "  - github_ssh_key"
    echo "  - github_token"
    echo "  - gitlab_private_token"
    echo "  - google_cm"
    echo "  - google_maps_key"
    echo "  - heroku_api_key"
    echo "  - instagram_access_token"
    echo "  - mailchimp_api_key"
    echo "  - mailgun_api_key"
    echo "  - mailjet"
    echo "  - mapbox_access_token"
    echo "  - pagerduty_api_token"
    echo "  - paypal_key_sb"
    echo "  - paypal_key_live"
    echo "  - paypal_token_sb"
    echo "  - paypal_token_live"
    echo "  - pendo_integration_key"
    echo "  - salesforce_access_token"
    echo "  - saucelabs_ukey"
    echo "  - sendgrid_api_key"
    echo "  - slack_api_token"
    echo "  - slack_webhook"
    echo "  - square_secret"
    echo "  - square_auth_token"
    echo "  - travisci_api_token"
    echo "  - twilio_sid_token"
    echo "  - twitter_api_secret"
    echo "  - twitter_bearer_token"
    echo "  - spotify_access_token"
    echo "  - stripe_key_live"
    echo "  - wakatime_api_key"
    echo "  - wompi_auth_bearer_sb"
    echo "  - wompi_auth_bearer_live"
    echo "  - wpengine_api_key"
    echo "  - zapier_webhook"
    echo "  - zendesk_access_token"
    echo
    echo "Todo:"
    echo "  -"
    if [ -n "$1" ] ; then
        echo "Error: "$1"!"
    fi
    exit
}

if [ $# -lt 1 ] ; then
    usage
fi

cmd=""

case $1 in
    'asana_access_token')
        if [ $# -eq 2 ] ; then
            cmd="curl -H 'Authorization: Bearer $2' 'https://app.asana.com/api/1.0/users/me'"
        else
            echo "Usage: $0 $1 <token>"
        fi
    ;;
    'algolia_api_key')
        if [ $# -eq 4 ] ; then
            cmd="curl --request PUT --url 'https://$2-1.algolianet.com/1/indexes/$3/settings' --header 'Content-Type: application/json' --header 'x-algolia-api-key: $4' --header 'x-algolia-application-id: $2' --data '{\"highlightPreTag\":\"<script>alert(1);</script>\"}'"
            echo $cmd
        else
            echo "Usage: $0 $1 <application_id> <index> <api_key>"
            echo
            echo "curl --request PUT --url 'https://[APPLICATION_ID]-1.algolianet.com/1/indexes/[INDEX]/settings' --header 'Content-Type: application/json' --header 'x-algolia-api-key: [KEY]' --header 'x-algolia-application-id: [APPLICATION_ID]' --data '{\"highlightPreTag\":\"<script>alert(1);</script>\"}'"
        fi
        echo
        echo "Be cautious when running this command, since the payload might execute within an administrative environment,"
        echo "depending on what index you are editing the 'highlightPreTag' of."
        echo "It's recommended to use a more silent payload (such as XSS Hunter) to prove the possible cross-site scripting attack."
        echo
        exit
    ;;
    'aws_secret')
        if [ $# -eq 3 ] ; then
            cmd="export AWS_ACCESS_KEY_ID='$2' ; export AWS_SECRET_ACCESS_KEY='$3' ; aws sts get-caller-identity"
        else
            echo "Usage: $0 $1 <access_key> <secret_access_key>"
        fi
    ;;
    'azure_tenant')
        if [ $# -eq 4 ] ; then
            cmd="curl -X POST -H 'Content-Type: application/x-www-form-urlencoded' -d 'client_id=$2&scope=https%3A%2F%2Fgraph.microsoft.com%2F.default&client_secret=$3&grant_type=client_credentials' 'https://login.microsoftonline.com/$4/oauth2/v2.0/token'"
        else
            echo "Usage: $0 $1 <client_id> <client_secret> <tenant_id>"
        fi
    ;;
    'bitly_access_token')
        if [ $# -eq 2 ] ; then
            cmd="firefox 'https://api-ssl.bitly.com/v3/shorten?access_token=$2&longUrl=https://www.google.com'"
        else
            echo "Usage: $0 $1 <access_token>"
            echo
            echo 'Visit the follow url:'
            echo 'https://api-ssl.bitly.com/v3/shorten?access_token=[ACCESS_TOKEN]&longUrl=https://www.google.com'
        fi
    ;;
    'branchio_secret')
        if [ $# -eq 3 ] ; then
            cmd="firefox 'https://api2.branch.io/v1/app/$2?branch_secret=$3'"
        else
            echo "Usage: $0 $1 <key> <secret>"
            echo
            echo 'Visit the follow url:'
            echo 'https://api2.branch.io/v1/app/[KEY]?branch_secret=[SECRET]'
        fi
    ;;
    'browserstack_access_key')
        if [ $# -eq 3 ] ; then
            cmd="curl -u '$2:$3' 'https://api.browserstack.com/automate/plan.json'"
        else
            echo "Usage: $0 $1 <username> <access_key>"
        fi
    ;;
    'buildkite_access_token')
        if [ $# -eq 2 ] ; then
            cmd="curl -H 'Authorization: Bearer $2' 'https://api.buildkite.com/v2/user'"
        else
            echo "Usage: $0 $1 <token>"
        fi
    ;;
    'comcast_access_token')
        if [ $# -eq 2 ] ; then
            cmd="curl -X GET -H 'Content-Type: application/json' -H 'Authorization: Bearer $2' 'https://aum.iris.comcast.net/v1.1/user/current'"
        else
            echo "Usage: $0 $1 <token>"
        fi
    ;;
    'datadog_api_key')
        if [ $# -eq 3 ] ; then
            cmd="curl 'https://api.datadoghq.com/api/v1/dashboard?api_key=$2&application_key=$3'"
        else
            echo "Usage: $0 $1 <api_key> <application_key>"
        fi
    ;;
    'deviantart_secret')
        if [ $# -eq 3 ] ; then
            cmd="curl 'https://www.deviantart.com/oauth2/token' -d 'grant_type=client_credentials' -d 'client_id=$2' -d 'client_secret=$3'"
        else
            echo "Usage: $0 $1 <client_id> <client_secret>"
        fi
    ;;
    'deviantart_access_token')
        if [ $# -eq 2 ] ; then
            cmd="curl 'https://www.deviantart.com/api/v1/oauth2/placebo' -d 'access_token=$2'"
        else
            echo "Usage: $0 $1 <access_token>"
        fi
    ;;
    'dropbox_api_token')
        if [ $# -eq 2 ] ; then
            cmd="curl -X POST 'https://api.dropboxapi.com/2/users/get_current_account' --header 'Authorization: Bearer $2'"
        else
            echo "Usage: $0 $1 <token>"
        fi
    ;;
    'facebook_appsecret')
        if [ $# -eq 3 ] ; then
            cmd="curl 'https://graph.facebook.com/oauth/access_token?client_id=$2&client_secret=$3&redirect_uri=&grant_type=client_credentials'"
        else
            echo "Usage: $0 $1 <client_id> <client_secret>"
            echo
            echo "You can generate access tokens by visiting the URL below:"
            echo "https://graph.facebook.com/oauth/access_token?client_id=[CLIENT_ID]&client_secret=[CLIENT_SECRET]&redirect_uri=&grant_type=client_credentials"
        fi
    ;;
    'facebook_access_token')
        if [ $# -eq 2 ] ; then
            cmd="firefox 'https://developers.facebook.com/tools/debug/accesstoken/?access_token=$2&version=v3.2'"
        else
            echo "Usage: $0 $1 <access_token>"
            echo
            echo "Visit the following URL:"
            echo "https://developers.facebook.com/tools/debug/accesstoken/?access_token=[ACCESS_TOKEN]&version=v3.2"
        fi
    ;;
    'firebase_custom_token')
        if [ $# -eq 3 ] ; then
            cmd="curl -s -X POST -H 'Content-Type: application/json' -d '{\"custom_token\":\"$3\"}' 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyCustomToken?key=$2'"
        else
            echo "Usage: $0 $1 <api_key> <custom_token>"
        fi
    ;;
    'firebase_id_token')
        if [ $# -eq 3 ] ; then
            cmd="curl -s -X POST -H 'Content-Type: application/json' -d '{\"idToken\":\"$3\"}' 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyCustomToken?key=$2'"
        else
            echo "Usage: $0 $1 <api_key> <id_token>"
        fi
    ;;
    'github_client')
        if [ $# -eq 3 ] ; then
            cmd="curl 'https://api.github.com/users/whatever?client_id=$2&client_secret=$3'"
        else
            echo "Usage: $0 $1 <client_id> <client_secret>"
        fi
    ;;
    'github_ssh_key')
        if [ $# -eq 2 ] ; then
            if [ -f $2 ] ; then
                cmd="ssh -i $2 -T git@github.com"
            else
                echo "Usage: $0 $1 <path_to_private_key>"
                echo
                echo "File not found: $2"
                echo
                exit
            fi
        else
            echo "Usage: $0 $1 <path_to_private_key>"
            echo
            echo "SSH private keys can be tested against github.com to see if they are registered against an existing user account."
            echo "If the key exists, the username corresponding to the key will be provided."
            echo "https://github.com/streaak/keyhacks/issues/2"
        fi
    ;;
    'github_token')
        if [ $# -eq 2 ] ; then
            cmd="curl -s -H 'Authorization: Bearer $2' 'https://api.github.com/search/code?sort=indexed&order=desc&q=osefdtc'"
        else
            echo "Usage: $0 $1 <token>"
            echo
            echo "If the token is valid, you should see the result of the search."
        fi
    ;;
    'gitlab_private_token')
        if [ $# -eq 3 ] ; then
            cmd="curl 'https://$2/api/v4/projects?private_token=$3'"
        else
            echo "Usage: $0 $1 <subdomain> <token>"
        fi
    ;;
    'google_cm')
        if [ $# -eq 2 ] ; then
            cmd="curl -s -X POST --header 'Authorization: key=$2' --header 'Content-Type:application/json' 'https://gcm-http.googleapis.com/gcm/send' -d '{\"registration_ids\":[\"1\"]}'"
        else
            echo "Usage: $0 $1 <key>"
        fi
    ;;
    'google_maps_key')
        if [ $# -eq 2 ] ; then
            cmd="curl 'https://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&key=$2'"
        else
            echo "Usage: $0 $1 <key>"
        fi
    ;;
    'heroku_api_key')
        if [ $# -eq 2 ] ; then
            cmd="curl -X POST 'https://api.heroku.com/apps' -H 'Accept: application/vnd.heroku+json; version=3' -H 'Authorization: Bearer $2'"
        else
            echo "Usage: $0 $1 <key>"
        fi
    ;;
    'instagram_access_token')
        if [ $# -eq 2 ] ; then
            cmd="firefox 'https://api.instagram.com/v1/users/self/?access_token=$2'"
        else
            echo "Usage: $0 $1 <token>"
            echo
            echo "Visit the following URL:"
            echo "https://api.instagram.com/v1/users/self/?access_token=[ACCESS_TOKEN]"
        fi
    ;;
    'mailchimp_api_key')
        if [ $# -eq 3 ] ; then
            cmd="curl --request GET --url 'https://$2.api.mailchimp.com/3.0/' --user '$2:$3' --include"
        else
            echo "Usage: $0 $1 <dc> <key>"
            echo
            echo "The <dc> part of the URL corresponds to the data center for your account."
            echo "For example, if the last part of your Mailchimp API key is 'us6', all API endpoints for your account are available at https://us6.api.mailchimp.com/3.0/."
        fi
    ;;
    'mailgun_api_key')
        if [ $# -eq 2 ] ; then
            cmd="curl --user 'api:key-$2' 'https://api.mailgun.net/v3/domains'"
        else
            echo "Usage: $0 $1 <key>"
        fi
    ;;
    'mailjet')
        if [ $# -eq 3 ] ; then
            cmd="curl -X GET --user '$2:$3' 'https://api.mailjet.com/v3/REST/contactstatistics'"
        else
            echo "Usage: $0 $1 <key> <secret>"
        fi
    ;;
    'mapbox_access_token')
        if [ $# -eq 2 ] ; then
            cmd="curl 'https://api.mapbox.com/geocoding/v5/mapbox.places/Los%20Angeles.json?access_token=$2'"
        else
            echo "Usage: $0 $1 <token>"
        fi
    ;;
    'pagerduty_api_token')
        if [ $# -eq 2 ] ; then
            cmd="curl -H 'Accept: application/vnd.pagerduty+json;version=2' -H 'Authorization: Token token=$2' -X GET 'https://api.pagerduty.com/schedules'"
        else
            echo "Usage: $0 $1 <token>"
        fi
    ;;
    'paypal_key_sb')
        if [ $# -eq 3 ] ; then
            cmd="curl 'https://api.sandbox.paypal.com/v1/oauth2/token' -H 'Accept: application/json' -H 'Accept-Language: en_US' -u '$2:$3' -d 'grant_type=client_credentials'"
        else
            echo "Usage: $0 $1 <client_id> <client_secret>"
        fi
    ;;
    'paypal_key_live')
        if [ $# -eq 3 ] ; then
            cmd="curl 'https://api.paypal.com/v1/oauth2/token' -H 'Accept: application/json' -H 'Accept-Language: en_US' -u '$2:$3' -d 'grant_type=client_credentials'"
        else
            echo "Usage: $0 $1 <client_id> <client_secret>"
        fi
    ;;
    'paypal_token_sb')
        if [ $# -eq 2 ] ; then
            cmd="curl -X GET 'https://api.sandbox.paypal.com/v1/identity/oauth2/userinfo?schema=paypalv1.1' -H 'Content-Type: application/json' -H 'Authorization: Bearer $2'"
        else
            echo "Usage: $0 $1 <token>"
        fi
    ;;
    'paypal_token_live')
        if [ $# -eq 2 ] ; then
            cmd="curl -X GET 'https://api.paypal.com/v1/identity/oauth2/userinfo?schema=paypalv1.1' -H 'Content-Type: application/json' -H 'Authorization: Bearer $2'"
        else
            echo "Usage: $0 $1 <token>"
        fi
    ;;
    'pendo_integration_key')
        if [ $# -eq 2 ] ; then
            cmd="curl -X GET 'https://app.pendo.io/api/v1/metadata/schema/account' -H 'content-type: application/json' -H 'x-pendo-integration-key:$2'"
        else
            echo "Usage: $0 $1 <integration_key>"
        fi
    ;;
    'salesforce_access_token')
        if [ $# -eq 3 ] ; then
            cmd="curl 'https://$2.salesforce.com/services/data/v20.0/' -H 'Authorization: Bearer $3'"
        else
            echo "Usage: $0 $1 <instance_name> <token>"
        fi
    ;;
    'saucelabs_ukey')
        if [ $# -eq 3 ] ; then
            cmd="curl -u '$2:$3' 'https://saucelabs.com/rest/v1/users/USERNAME'"
        else
            echo "Usage: $0 $1 <username> <access_key>"
        fi
    ;;
    'sendgrid_api_key')
        if [ $# -eq 2 ] ; then
            cmd="curl -X GET 'https://api.sendgrid.com/v3/scopes' -H 'Authorization: Bearer $2' -H 'Content-Type: application/json'"
        else
            echo "Usage: $0 $1 <key>"
        fi
    ;;
    'slack_api_token')
        if [ $# -eq 2 ] ; then
            cmd="curl -sX POST 'https://slack.com/api/auth.test?token=$2&pretty=1'"
        else
            echo "Usage: $0 $1 <token>"
        fi
    ;;
    'slack_webhook')
        if [ $# -eq 2 ] ; then
            cmd="curl -s -X POST -H 'Content-type: application/json' -d '{'text':''}' '$2'"
        else
            echo "Usage: $0 $1 <webhook:https://...>"
            echo
            echo "If the command returns 'missing_text_or_fallback_or_attachments' or 'no text', it means that the URL is valid, any other responses would mean that the URL is invalid."
        fi
    ;;
    'square_secret')
        if [ $# -eq 3 ] ; then
            cmd="curl 'https://squareup.com/oauth2/revoke' -d '{\"access_token\":\"706b16b2fb732ab6079a10fea61d078b\",\"client_id\":\"$2\"}'  -H 'Content-Type: application/json' -H 'Authorization: Client $3'"
        else
            echo "Usage: $0 $1 <client_id> <client_secret>"
            echo
            echo "Valid: empty"
            echo "Not valid: {\"message\":\"Not Authorized\",\"type\":\"service.not_authorized\"}"
        fi
    ;;
    'square_auth_token')
        if [ $# -eq 2 ] ; then
            cmd="curl 'https://connect.squareup.com/v2/locations' -H 'Authorization: Bearer $2'"
        else
            echo "Usage: $0 $1 <token>"
            echo
            echo "Valid: {\"locations\":[{\"id\":....."
            echo "Not valid: {\"errors\":[{\"category\":\"AUTHENTICATION_ERROR....."
        fi
    ;;
    'stripe_key_live')
        if [ $# -eq 2 ] ; then
            cmd="curl 'https://api.stripe.com/v1/' -u '$2:'"
        else
            echo "Usage: $0 $1 <key>"
        fi
        echo
        echo "Keep the colon at the end of the token to prevent cURL from requesting a password."
        echo
    ;;
    'travisci_api_token')
        if [ $# -eq 2 ] ; then
            cmd="curl -H 'Travis-API-Version: 3' -H 'Authorization: token $2' 'https://api.travis-ci.com/user'"
        else
            echo "Usage: $0 $1 <token>"
        fi
    ;;
    'twilio_sid_token')
        if [ $# -eq 3 ] ; then
            cmd="curl -s -G 'https://api.twilio.com/2010-04-01/Accounts' -u '$2:$3'"
        else
            echo "Usage: $0 $1 <account_sid> <auth_token>"
        fi
    ;;
    'twitter_api_secret')
        if [ $# -eq 3 ] ; then
            cmd="curl -u '$2:$3' --data 'grant_type=client_credentials' 'https://api.twitter.com/oauth2/token'"
        else
            echo "Usage: $0 $1 <api_key> <api_secret_key>"
        fi
    ;;
    'twitter_bearer_token')
        if [ $# -eq 3 ] ; then
            cmd="curl --request GET --url 'https://api.twitter.com/1.1/account_activity/all/subscriptions/count.json' --header 'authorization: Bearer $2'"
        else
            echo "Usage: $0 $1 <token>"
        fi
    ;;
    'spotify_access_token')
        if [ $# -eq 2 ] ; then
            cmd="curl -H 'Authorization: Bearer $2' 'https://api.spotify.com/v1/me'"
        else
            echo "Usage: $0 $1 <token>"
        fi
    ;;
    'wakatime_api_key')
        if [ $# -eq 2 ] ; then
            cmd="curl 'https://wakatime.com/api/v1/users/current/projects/?api_key=$2'"
        else
            echo "Usage: $0 $1 <api_key>"
        fi
    ;;
    'wompi_auth_bearer_sb')
        if [ $# -eq 2 ] ; then
            cmd="curl -H 'Content-Type: application/json' -H 'Authorization: Bearer $2'  'https://sandbox.wompi.co/v1/pse/financial_institutions'"
        else
            echo "Usage: $0 $1 <auth_bearer>"
        fi
    ;;
    'wompi_auth_bearer_live')
        if [ $# -eq 2 ] ; then
            cmd="curl -H 'Content-Type: application/json' -H 'Authorization: Bearer $2'  'https://production.wompi.co/v1/pse/financial_institutions'"
        else
            echo "Usage: $0 $1 <auth_bearer>"
        fi
    ;;
    'wpengine_api_key')
        if [ $# -eq 3 ] ; then
            cmd="curl 'https://api.wpengine.com/1.2/?method=site&account_name=$2&wpe_apikey=$3'"
        else
            echo "Usage: $0 $1 <account_name> <api_key>"
            echo
            echo "This issue can be further exploited by checking out @hateshape 's gist:"
            echo "https://gist.github.com/hateshape/2e671ea71d7c243fac7ebf51fb738f0a"
        fi
    ;;
    'zapier_webhook')
        if [ $# -eq 2 ] ; then
            cmd="curl -H 'Accept: application/json' -H 'Content-Type: application/json' -X POST -d '{\"name\":\"grosbisou\"}' '$2'"
        else
            echo "Usage: $0 $1 <webhook:https://...>"
        fi
    ;;
    'zendesk_access_token')
        if [ $# -eq 3 ] ; then
            cmd="curl 'https://$2.zendesk.com/api/v2/tickets.json' -H 'Authorization: Bearer $3'"
        else
            echo "Usage: $0 $1 <subdomain> <token>"
        fi
    ;;
    *)
        usage
    ;;
esac

echo $cmd
echo
eval $cmd
echo
echo
