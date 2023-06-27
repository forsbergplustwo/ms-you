# MS+you - symptoms tracker
**A free service for people with Multiple Sclerosis to track their symptoms and changes over time.**

The app helps to track individual and total severity of your symptoms, so you can see when an attack is coming on or is starting to subside. You can also add notes to keep track of important dates, such as starting a new medication.

Available at: https://msplusyou.com


## Features

- [x] Signup / Login etc
- [x] Track Symptoms and their changes in severity over time
- [x] Graph total symptoms and individual symptoms
- [x] Add Notes for important dates
- [x] Multi-language support
- [x] ncryption on all user input fields when saved to DB (symptom titles, descriptions etc.)

## Todo

- [ ] Landing page
- [ ] iOS mobile app (Turbo Native / Strada?)
- [ ] "Sign in with Apple" support (OmniAuth)
- [ ] "Sign in with Google" support (OmniAuth)
- [ ] Tests 😅


## Nerdy details

Very helpful libraries used in the project, for which I am thankful:

- [Polaris View Components](https://github.com/baoagency/polaris_view_components) for the view layouts and styling
- Rails 7 encrypted fields for any sensitive content
- [instant18n](https://github.com/obie/instant18n) which uses chatGPT to translate text on the fly, into any language
- [Highcharts](https://www.highcharts.com/) for the graphing and annotation features


###
After checking out the repo, run `bin/setup` to install dependencies and create db etc. Then, run `bin/rails db:encryption:init` to get the needed details for encryption. Add these to the credentials file `bin/rails credentials:edit` (delete the existing one and create your own).

Finally, set either `OPENAI_ACCESS_TOKEN` to env variables, or set `openaui_access_token:` in the credentials file for the translations support.

### License
The gem is available as open source under the terms of the [MIT License](/LICENSE.txt).

### Code of Conduct
Everyone interacting in the Instant18n project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](/CODE_OF_CONDUCT.md).

### Acknowledgments
MS+you uses the GPT-3 language model API provided by OpenAI.
