<a name="2020-09-30"></a>
### 2020-09-30


#### Features

* setup canonical initalizer	 ([d080696](/../../commit/d080696))
* integrate canonical gem	 ([fd87121](/../../commit/fd87121))


<a name="2020-09-29"></a>
### 2020-09-29


#### Features

* Add dynamic title and update social media tags	 ([b0dab5d](/../../commit/b0dab5d))
* move features the LandingPageFeaturesComponent	 ([2319e8c](/../../commit/2319e8c))
* Tweak privacy a bit	 ([6bacaca](/../../commit/6bacaca))
* match styling to privacy page	 ([64db75a](/../../commit/64db75a))
* Add privacy page	 ([8665d24](/../../commit/8665d24))
* Add terms page	 ([96da7d7](/../../commit/96da7d7))
* Create landing page with more copy	 ([d95b2f2](/../../commit/d95b2f2))


#### Bug Fixes

* change login link	 ([b3d4405](/../../commit/b3d4405))
* Add missing login button	 ([755f982](/../../commit/755f982))


<a name="2020-09-28"></a>
### 2020-09-28


#### Features

* Change title text for public pages	 ([9beacca](/../../commit/9beacca))
* Create a separate marketing pack	 ([31cbe7a](/../../commit/31cbe7a))
* Add API to menu dropdown and tweak page	 ([c18279c](/../../commit/c18279c))
* Apply proper authorization through out the app	 ([f16c0ff](/../../commit/f16c0ff))
* Add dashboard link in menu dropdown	 ([488f543](/../../commit/488f543))
* Add default timezone for user	 ([af40096](/../../commit/af40096))
* Add AccountsSettingsComponent	 ([08c763c](/../../commit/08c763c))
* Add visits per month card	 ([390b23f](/../../commit/390b23f))
* remove username in navbar	 ([e523327](/../../commit/e523327))
* Make settings link go to settings path	 ([eb24580](/../../commit/eb24580))
* enable trial for new users again	 ([fc58f34](/../../commit/fc58f34))
* Show cancel button when user is already in a plan	 ([730be9e](/../../commit/730be9e))
* Add waiting page when user subscribes	 ([18c60d9](/../../commit/18c60d9))
* Connect AvailablePlan with Paddle checkout	 ([16b48a3](/../../commit/16b48a3))
* Add Plan model	 ([9328c7f](/../../commit/9328c7f))
* Create page for upgrading free plan	 ([458be73](/../../commit/458be73))
* Create CurrentPlanComponent	 ([bb0d0ab](/../../commit/bb0d0ab))


#### Bug Fixes

* skip authorization check for redirect controller	 ([ffb5c81](/../../commit/ffb5c81))
* Bring back the account method in User	 ([fab009c](/../../commit/fab009c))
* Remove inner container class	 ([ed6251e](/../../commit/ed6251e))
* proper suffix per plan	 ([ecc2f63](/../../commit/ecc2f63))


<a name="2020-09-27"></a>
### 2020-09-27


#### Features

* remove previous implementation of billing	 ([a677282](/../../commit/a677282))


<a name="2020-09-26"></a>
### 2020-09-26


#### Features

* Remove IP address on logs when doing Geolookup Job	 ([e447a40](/../../commit/e447a40))


<a name="2020-09-25"></a>
### 2020-09-25


#### Features

* Hide bio and other fields that are not essentials	 ([ebc1fa0](/../../commit/ebc1fa0))


<a name="2020-09-24"></a>
### 2020-09-24


#### Features

* Add Metatags and Plausible in auth pages	 ([c94a613](/../../commit/c94a613))
* Create humans.txt	 ([881fe8d](/../../commit/881fe8d))
* Add sitemap.xml	 ([c58b2ea](/../../commit/c58b2ea))
* Create task to associate current link visits to users	 ([72d11d3](/../../commit/72d11d3))
* attach User when creating a LinkVisit	 ([5104d81](/../../commit/5104d81))
* Add belongs_to from LinkVisit to User	 ([da87c1d](/../../commit/da87c1d))


#### Bug Fixes

* clean up rake task	 ([d4fe880](/../../commit/d4fe880))


<a name="2020-09-21"></a>
### 2020-09-21


#### Features

* Clean out referrers	 ([bd87f52](/../../commit/bd87f52))
* Show unique counts in referrers table	 ([b1dd507](/../../commit/b1dd507))


#### Bug Fixes

* add nil as default value for account timezone	 ([c63e51f](/../../commit/c63e51f))
* blank lines in top links table for stats less than the limit	 ([98b5837](/../../commit/98b5837))
* don't show stats with nil keys	 ([2eb096d](/../../commit/2eb096d))
* blank lines in referrer table for stats less than the limit	 ([c78c665](/../../commit/c78c665))
* Restore graph styling	 ([1dc3955](/../../commit/1dc3955))


<a name="2020-09-18"></a>
### 2020-09-18


#### Features

* Remove free trial, make all users on free	 ([b174853](/../../commit/b174853))
* Use LogoComponent on Bio	 ([3338c0f](/../../commit/3338c0f))
* Remove ahoy	 ([2a62cd2](/../../commit/2a62cd2))
* Remove tailwind completely	 ([edf2335](/../../commit/edf2335))
* Use the new stats information in Dashboard	 ([f70b0cf](/../../commit/f70b0cf))
* Use the new stats information in LinkShow	 ([c24975f](/../../commit/c24975f))
* Use Direct instead of Unknown when referrer is blank	 ([6e91f99](/../../commit/6e91f99))


<a name="2020-09-17"></a>
### 2020-09-17


#### Features

* Use custom domain snippet of plausible	 ([71fb8d1](/../../commit/71fb8d1))
* Show shorten links url instead of name in top links card	 ([ebf8802](/../../commit/ebf8802))
* Remove pacifico google font	 ([084a9b7](/../../commit/084a9b7))


#### Bug Fixes

* Total visits of a link/links should be sorted by date asc	 ([a6f2c99](/../../commit/a6f2c99))


<a name="2020-09-16"></a>
### 2020-09-16


#### Features

* Don’t create LinkVisit record for bots	 ([4db1186](/../../commit/4db1186))
* Add reduce_if to close out all actions even if it is an organizer	 ([5f3a3e0](/../../commit/5f3a3e0))
* Create rake task for cleaning LinkVisit device_types	 ([848e0a1](/../../commit/848e0a1))
* Capitalize device_type and also make smartphone tag as mobile	 ([62f34c5](/../../commit/62f34c5))
* Move fetching of visitor country to a background job	 ([eba1744](/../../commit/eba1744))
* Install and configure lograge	 ([5660adf](/../../commit/5660adf))
* Also show alternative stat for admin	 ([ad3780b](/../../commit/ad3780b))
* Show email or username in the navbar	 ([ea0cde9](/../../commit/ea0cde9))
* allow admin user to view all links	 ([6c7260a](/../../commit/6c7260a))
* Add Top links and Visit Chart in admin dashboard	 ([e315a06](/../../commit/e315a06))
* Show alternative link stats to impersonate user only	 ([eabd605](/../../commit/eabd605))
* Add GetLinkReferrers	 ([bc25d07](/../../commit/bc25d07))
* Add GetLinkBrowsers	 ([84c20e1](/../../commit/84c20e1))
* Add GetLinkDeviceType	 ([803a630](/../../commit/803a630))
* Add GetLinkCountries	 ([5c1c69f](/../../commit/5c1c69f))
* Create GetVisitStats organizer	 ([4a4ca54](/../../commit/4a4ca54))


<a name="2020-09-15"></a>
### 2020-09-15


#### Features

* Run CreateSaltJob every 12am	 ([ffbcde6](/../../commit/ffbcde6))
* Add AddVisitInformation	 ([fd59948](/../../commit/fd59948))
* Add SaveLinkVisit	 ([d6adf05](/../../commit/d6adf05))
* Add ParseVisitorReferrer	 ([bf48deb](/../../commit/bf48deb))
* Add ParseVisitorCountry	 ([fab61a2](/../../commit/fab61a2))
* Add ParseVisitorDeviceType	 ([2ae540c](/../../commit/2ae540c))
* Add InitializeVisitorDevice & ParseVisitorBrowser	 ([eb12ee9](/../../commit/eb12ee9))
* Add GenerateVisitorHashAction	 ([d1d4c40](/../../commit/d1d4c40))
* Create background job for creating new salt	 ([428c150](/../../commit/428c150))
* create salt model	 ([4912766](/../../commit/4912766))


<a name="2020-09-14"></a>
### 2020-09-14


#### Features

* remove pagination in links	 ([ee5e760](/../../commit/ee5e760))
* add copy button for short links	 ([47fa50f](/../../commit/47fa50f))
* remove app restrictions for now until I implement the new billing	 ([8a76f9b](/../../commit/8a76f9b))
* remove pagination in admin	 ([d7a851c](/../../commit/d7a851c))
* show original url link instead of name	 ([b9fb09b](/../../commit/b9fb09b))
* create DashboardHeaderComponent	 ([7a43fe9](/../../commit/7a43fe9))
* replace photo with navbar icon	 ([2ce172f](/../../commit/2ce172f))


#### Bug Fixes

* layout issue on trial notice on navbar	 ([ec34912](/../../commit/ec34912))
* dashboard display stats by links visited not links created	 ([545900c](/../../commit/545900c))


<a name="2020-09-10"></a>
### 2020-09-10


#### Features

* change host to digitalocean from aws	 ([e90870b](/../../commit/e90870b))
* change introduction text	 ([2b8e613](/../../commit/2b8e613))
* add social image card	 ([e178abe](/../../commit/e178abe))
* improve meta tags	 ([f527957](/../../commit/f527957))


<a name="2020-09-09"></a>
### 2020-09-09


#### Features

* add timezone support for account	 ([db8b5c8](/../../commit/db8b5c8))
* update meta tags	 ([ce4852c](/../../commit/ce4852c))
* add ads.txt file	 ([dc3dd13](/../../commit/dc3dd13))
* top links only show links with atleast 1 visit count	 ([492a552](/../../commit/492a552))


<a name="2020-09-08"></a>
### 2020-09-08


#### Features

* allow use of cookies but mask ip still	 ([933f4a6](/../../commit/933f4a6))
* change title and meta tags to privacy focused	 ([6a16bd8](/../../commit/6a16bd8))
* remove pricing from the page	 ([6c0abe6](/../../commit/6c0abe6))
* show views table for dashboard and link show page	 ([e0e7330](/../../commit/e0e7330))
* select period from dropdown	 ([a0a574c](/../../commit/a0a574c))
* support period for dashboard stats	 ([a3f5211](/../../commit/a3f5211))


<a name="2020-09-07"></a>
### 2020-09-07


#### Features

* add support for querying with date period for link show page	 ([54c77be](/../../commit/54c77be))
* move top links to TopLinksTableComponent	 ([79cc57d](/../../commit/79cc57d))
* hide other menu items	 ([c4ed0a3](/../../commit/c4ed0a3))
* make dashboard root path	 ([e828c87](/../../commit/e828c87))
* create empty rows if didn’t receive total stat table limit	 ([219c6c2](/../../commit/219c6c2))
* create a mapper for grouping related domain in referrers	 ([311b218](/../../commit/311b218))
* show device type, browser and countries in dashboard	 ([1217471](/../../commit/1217471))
* create impersonate banner	 ([9277ee7](/../../commit/9277ee7))
* enable admin to impersonate user	 ([a877ec1](/../../commit/a877ec1))
* change dashboard information	 ([8e181c8](/../../commit/8e181c8))
* refactor fetching of total stats to only query the links at the start	 ([211d707](/../../commit/211d707))
* change introduction text and register button	 ([4fa87d3](/../../commit/4fa87d3))


<a name="2020-09-06"></a>
### 2020-09-06


#### Features

* change korea repubic of to south korea	 ([1606b15](/../../commit/1606b15))
* increase row to 10 for link stat card	 ([1d64899](/../../commit/1d64899))
* change visit count to every visit instead of uniques	 ([fe53551](/../../commit/fe53551))
* Configure ahoy to be gdpr compliant	 ([1ebe5e7](/../../commit/1ebe5e7))
* add blank links for terms of service and privacy policy	 ([4061eb9](/../../commit/4061eb9))
* add btfy logo on bio	 ([ce0621b](/../../commit/ce0621b))


<a name="2020-09-05"></a>
### 2020-09-05


#### Features

* allow trial users to access paid content	 ([6ae0adb](/../../commit/6ae0adb))
* show trials days in the navbar	 ([0c9cc42](/../../commit/0c9cc42))
* add 30 days trial for new users	 ([6610b43](/../../commit/6610b43))


<a name="2020-09-04"></a>
### 2020-09-04


#### Features

* require redirect_url when adding a domain	 ([0365b16](/../../commit/0365b16))
* redirect user to when visiting a base url connected to btfy	 ([1036bee](/../../commit/1036bee))
* restrict api to subscribe users only	 ([21a9910](/../../commit/21a9910))
* add rate limit to api	 ([6c28232](/../../commit/6c28232))
* delete blank tests	 ([02d746f](/../../commit/02d746f))
* display custom domain id in the table	 ([81afc5a](/../../commit/81afc5a))
* add spec for creating link with custom domain	 ([74201f7](/../../commit/74201f7))
* add documentation for authentication and links	 ([7275807](/../../commit/7275807))
* allow users to create/deactivate/reactivate api keys	 ([cec684c](/../../commit/cec684c))


#### Bug Fixes

* don't hide login button on mobile	 ([bc0d3c0](/../../commit/bc0d3c0))
* bring back mem_cache_store usage	 ([c8f5e41](/../../commit/c8f5e41))
* use env for dynamic api base url	 ([bb1a4f5](/../../commit/bb1a4f5))
* force highlightjs to load in api page	 ([6c675df](/../../commit/6c675df))


<a name="2020-09-03"></a>
### 2020-09-03


#### Features

* show generated api keys	 ([2385eb6](/../../commit/2385eb6))
* enable creation of links from api	 ([1c78957](/../../commit/1c78957))
* authenticate api request with api keys	 ([67d98d3](/../../commit/67d98d3))
* create api keys table	 ([e455fc7](/../../commit/e455fc7))


<a name="2020-09-02"></a>
### 2020-09-02


#### Features

* show social links in the public profile page	 ([f36e485](/../../commit/f36e485))
* change buttons to dropdown menu	 ([c64d592](/../../commit/c64d592))
* allow saving of social links to public profile	 ([97d6489](/../../commit/97d6489))
* add and remove links to public profile	 ([d77de1a](/../../commit/d77de1a))
* create public profile and link to user	 ([0d6b2d5](/../../commit/0d6b2d5))
* users can now enable/disable bio feature	 ([f884a21](/../../commit/f884a21))
* show a public profile page	 ([d9342a6](/../../commit/d9342a6))
* add username to user in registration and account page	 ([07798e5](/../../commit/07798e5))
* add setup bio page	 ([bcf148b](/../../commit/bcf148b))
* create account association on first load	 ([5d17190](/../../commit/5d17190))
* allow uploading to amazon s3	 ([df5245f](/../../commit/df5245f))
* allow uploading of avatar image	 ([ce51f2b](/../../commit/ce51f2b))
* enable updating of account page	 ([5af2e0f](/../../commit/5af2e0f))
* associate account with user	 ([75c0a29](/../../commit/75c0a29))
* added activestorage	 ([132f37a](/../../commit/132f37a))
* add an account page in settings	 ([53a3859](/../../commit/53a3859))
* change settings to billing	 ([d929f88](/../../commit/d929f88))


<a name="2020-09-01"></a>
### 2020-09-01


#### Features

* unify all bootstrap code across all layouts	 ([f00176f](/../../commit/f00176f))
* Add og:logo support	 ([2a573e0](/../../commit/2a573e0))


<a name="2020-08-31"></a>
### 2020-08-31


#### Features

* add sources, city and country flag icons to link individual stats	 ([1e26680](/../../commit/1e26680))
* move link stats to LinkStatCardComponent	 ([9cf904b](/../../commit/9cf904b))
* add meta tags needed for social media	 ([6189870](/../../commit/6189870))


#### Bug Fixes

* delete nil keys before sorting browsers	 ([fda9b7e](/../../commit/fda9b7e))
* lock down settings and support pages	 ([029de0f](/../../commit/029de0f))


<a name="2020-08-30"></a>
### 2020-08-30


#### Features

* Add test for LinkFinder	 ([6776dda](/../../commit/6776dda))


#### Bug Fixes

* lock down subscriptions page	 ([7e03d16](/../../commit/7e03d16))
* add .present? in ParseRequestParamsAction	 ([27540bb](/../../commit/27540bb))


<a name="2020-08-29"></a>
### 2020-08-29


#### Features

* enable user to contact support	 ([24c3cfa](/../../commit/24c3cfa))
* allow sending of emails in development	 ([3af887e](/../../commit/3af887e))
* add postmark for email sending	 ([55a4c2d](/../../commit/55a4c2d))
* remove fathom and drift support	 ([29e8027](/../../commit/29e8027))
* add dashboard to pricing	 ([73414dd](/../../commit/73414dd))
* remove beta banner	 ([9c5f6cd](/../../commit/9c5f6cd))
* add system test for creating a link	 ([54da734](/../../commit/54da734))
* delete test folder	 ([34d588a](/../../commit/34d588a))
* add edit user plans in admin	 ([49a69f2](/../../commit/49a69f2))
* add user plans index page	 ([305d648](/../../commit/305d648))
* only check for the total links if user is not susbcribed	 ([82c95b7](/../../commit/82c95b7))
* make it obvious that we are aggregating the current month data	 ([074958b](/../../commit/074958b))
* only show pagination if links are more than 5	 ([abc7f4c](/../../commit/abc7f4c))
* Add authorization for free and paid users	 ([25a1f60](/../../commit/25a1f60))
* redirect to links_path after editing a link	 ([d7b0058](/../../commit/d7b0058))


#### Bug Fixes

* don't use secure mode in postmark emails	 ([744e653](/../../commit/744e653))


<a name="2020-08-28"></a>
### 2020-08-28


#### Features

* enable user to subscribe or cancel a plan	 ([6651491](/../../commit/6651491))
* Create subscriptions page	 ([bb2edd6](/../../commit/bb2edd6))
* Update UserCurrentPlanCardComponent to optionally show the upgrade button	 ([8ecd446](/../../commit/8ecd446))
* Add billing page	 ([d517e98](/../../commit/d517e98))
* make a avatar dropdown	 ([9ba4461](/../../commit/9ba4461))
* Create GetGravatarLinkAction	 ([268d969](/../../commit/268d969))
* remove unused routes	 ([8db6df6](/../../commit/8db6df6))


#### Bug Fixes

* explicit routes for custom domains and links	 ([3606136](/../../commit/3606136))
* make link form inputs align	 ([a4727a9](/../../commit/a4727a9))
* dashboard routes and others	 ([e275c64](/../../commit/e275c64))
* user can edit link with same slug name	 ([99a9e8f](/../../commit/99a9e8f))
* add inter font	 ([9a049aa](/../../commit/9a049aa))


<a name="2020-08-27"></a>
### 2020-08-27


#### Features

* only alphanumeric characters are allowed in slug	 ([02d6726](/../../commit/02d6726))
* remove register button on pricing section	 ([e2881f6](/../../commit/e2881f6))
* Add register link on MarketingPricingCard	 ([472df20](/../../commit/472df20))
* Move domains index page to a table	 ([03485d8](/../../commit/03485d8))
* Move links index page to a table	 ([324e579](/../../commit/324e579))


<a name="2020-08-26"></a>
### 2020-08-26


#### Features

* use s3 link for dashboard image	 ([43bb7e8](/../../commit/43bb7e8))
* add amount in plan seed file	 ([049cbef](/../../commit/049cbef))
* add pretty urls for register and login	 ([e72e8d2](/../../commit/e72e8d2))
* build landing page	 ([d0beedf](/../../commit/d0beedf))
* Create MarketingProductIntroductionComponent	 ([cf46091](/../../commit/cf46091))
* Create MarketingPricingSectionComponent	 ([d78c8c2](/../../commit/d78c8c2))
* Move footer to MarketingFooterComponent	 ([f92bd4f](/../../commit/f92bd4f))
* add plans to seed file	 ([e860217](/../../commit/e860217))
* create MarketingPriceCardComponent	 ([cb5adee](/../../commit/cb5adee))


<a name="2020-08-25"></a>
### 2020-08-25


#### Features

* add Plausible analytics	 ([3d7bab4](/../../commit/3d7bab4))
* fix top links stats	 ([4911c10](/../../commit/4911c10))
* redirect links in dashboard to it's show page	 ([4bea0a9](/../../commit/4bea0a9))
* add MarketingNavbarComponent	 ([7dc4a48](/../../commit/7dc4a48))
* add marketing skeleton	 ([9f84524](/../../commit/9f84524))


#### Bug Fixes

* change root route and sidekiq	 ([2d7bdff](/../../commit/2d7bdff))


<a name="2020-08-24"></a>
### 2020-08-24


#### Features

* truncate links in AdminLinksTable	 ([fe059ac](/../../commit/fe059ac))
* truncate links in links list page	 ([2e9392b](/../../commit/2e9392b))
* enable use of btfy.io even after adding a custom domain	 ([69f3a5f](/../../commit/69f3a5f))
* add headway notification	 ([a4640d9](/../../commit/a4640d9))
* generate name and slug if not supplied by user	 ([8a3b9ab](/../../commit/8a3b9ab))
* create GenerateAvailableSlugAction	 ([1351e84](/../../commit/1351e84))
* add missing bootstrap js and jquery	 ([b1ffcc6](/../../commit/b1ffcc6))
* add admin users list	 ([b54d0b3](/../../commit/b54d0b3))
* remove feedback fish	 ([2fd2735](/../../commit/2fd2735))
* remove active label on domain	 ([dd3b43a](/../../commit/dd3b43a))
* add pagination to links page	 ([fb0d9c6](/../../commit/fb0d9c6))
* don't allow invalid urls	 ([b1d8d50](/../../commit/b1d8d50))
* truncate link in admin links table	 ([17a16fd](/../../commit/17a16fd))
* make /admin default to admin links index	 ([9df9503](/../../commit/9df9503))
* secure admin pages	 ([9087988](/../../commit/9087988))


#### Bug Fixes

* fix rails env key for fathom	 ([5da4a8c](/../../commit/5da4a8c))


<a name="2020-08-23"></a>
### 2020-08-23


#### Features

* add count for links and custom domains headers	 ([ea65d89](/../../commit/ea65d89))
* delete admin resource	 ([3cdca14](/../../commit/3cdca14))
* add user in admin links table	 ([f18facb](/../../commit/f18facb))
* add custom domains in seed file	 ([efec2ed](/../../commit/efec2ed))
* add admin custom domains list	 ([9034280](/../../commit/9034280))
* extract admin links to a table component	 ([b9acd94](/../../commit/b9acd94))
* create PagyComponent	 ([47e7e35](/../../commit/47e7e35))
* only enable fathom analytics on production	 ([37d5758](/../../commit/37d5758))
* add pagy	 ([2d03fbd](/../../commit/2d03fbd))
* add admin links page	 ([80dd48e](/../../commit/80dd48e))
* add skeleton admin page	 ([1c0a741](/../../commit/1c0a741))
* create admin users	 ([66a0522](/../../commit/66a0522))
* add users and links in seed file	 ([151a93c](/../../commit/151a93c))
* disable rollbar in development	 ([b7d1b69](/../../commit/b7d1b69))
* invalid url slug redirects to 404 instead of rollbar	 ([8d022a1](/../../commit/8d022a1))
* customize error pages	 ([efe930d](/../../commit/efe930d))
* add fathom analytics	 ([e65e889](/../../commit/e65e889))
* setup rollbar	 ([d451535](/../../commit/d451535))
* add feedback fish integration	 ([be26a4d](/../../commit/be26a4d))
* force ssl in production	 ([7a86906](/../../commit/7a86906))
* hide settings for now	 ([258b026](/../../commit/258b026))
* remove restrictions for now	 ([83e6176](/../../commit/83e6176))
* add skylight	 ([974ff94](/../../commit/974ff94))
* remove plan notice	 ([2f28539](/../../commit/2f28539))
* enable users to create a link without subscribing to a plan	 ([c95bc74](/../../commit/c95bc74))


<a name="2020-08-18"></a>
### 2020-08-18


#### Features

* update Procfile	 ([e56b45e](/../../commit/e56b45e))


<a name="2020-08-17"></a>
### 2020-08-17


#### Features

* redirect user to plans when it doesn't have yet	 ([e968828](/../../commit/e968828))
* add show page authorization	 ([94f9885](/../../commit/94f9885))
* install prettier-standard	 ([ffc84dd](/../../commit/ffc84dd))
* add instructions to manually refresh billing page when plan didn't update yet	 ([52526ce](/../../commit/52526ce))
* create user current plan card component	 ([54ee51f](/../../commit/54ee51f))
* round down the monthly value amount	 ([127d6b4](/../../commit/127d6b4))


<a name="2020-08-16"></a>
### 2020-08-16


#### Features

* improve custom domain adding instructions	 ([26a0ea0](/../../commit/26a0ea0))
* use active_link_to gem	 ([94a426e](/../../commit/94a426e))
* add authorization on creating links and custom domains	 ([1224fe9](/../../commit/1224fe9))
* add cancancan	 ([d422a61](/../../commit/d422a61))
* user can cancel subscription	 ([2a1062e](/../../commit/2a1062e))
* create subscription when a user subscribe	 ([b054673](/../../commit/b054673))
* add savings percentage logic	 ([be99479](/../../commit/be99479))
* connect paddle checkout to plans	 ([04fd146](/../../commit/04fd146))


#### Bug Fixes

* notification and spacing	 ([243d68a](/../../commit/243d68a))


<a name="2020-08-15"></a>
### 2020-08-15


#### Features

* create skeleton plan page and pricing card	 ([45aef09](/../../commit/45aef09))
* create billing skeleton page	 ([c57e17a](/../../commit/c57e17a))
* install pay gem	 ([ea62659](/../../commit/ea62659))
* delete related links when you delete a domain	 ([6810633](/../../commit/6810633))


<a name="2020-08-14"></a>
### 2020-08-14


#### Features

* various fixes in creating link	 ([8ea97d9](/../../commit/8ea97d9))
* add light-service logger	 ([42c84b4](/../../commit/42c84b4))
* various fixes	 ([4bfde33](/../../commit/4bfde33))
* customize link show page	 ([335646b](/../../commit/335646b))
* move the seeding of link stats to a service	 ([b500440](/../../commit/b500440))


<a name="2020-08-12"></a>
### 2020-08-12


#### Features

* style list and make it searchable via js	 ([63d4293](/../../commit/63d4293))
* add list.js	 ([87b72f0](/../../commit/87b72f0))
* create form notification component	 ([f6f97f4](/../../commit/f6f97f4))
* create page header with button component	 ([c590f9c](/../../commit/c590f9c))
* create page header component	 ([e9a15a4](/../../commit/e9a15a4))
* add dashkit	 ([ab85c62](/../../commit/ab85c62))
* create logo component	 ([d569a5e](/../../commit/d569a5e))


<a name="2020-08-09"></a>
### 2020-08-09


#### Features

* change logic for checking domain cname	 ([01dfa7b](/../../commit/01dfa7b))
* add procfiles	 ([bb93d49](/../../commit/bb93d49))
* check domain settings before saving	 ([713c415](/../../commit/713c415))
* add custom domains in settings	 ([471f81d](/../../commit/471f81d))
* create notification component	 ([ce3aad4](/../../commit/ce3aad4))


<a name="2020-08-08"></a>
### 2020-08-08


#### Features

* add settings to navbar	 ([88c7d1a](/../../commit/88c7d1a))
* add list of links in dashboard	 ([5747089](/../../commit/5747089))


<a name="2020-08-06"></a>
### 2020-08-06


#### Features

* use bootstrap 5 cdn	 ([e1cbe11](/../../commit/e1cbe11))


<a name="2020-08-02"></a>
### 2020-08-02


#### Features

* create StatsCardComponent	 ([27314ea](/../../commit/27314ea))


<a name="2020-08-01"></a>
### 2020-08-01


#### Features

* customize navbar	 ([82495e4](/../../commit/82495e4))


<a name="2020-07-31"></a>
### 2020-07-31


#### Features

* create dashboard page	 ([dca7b77](/../../commit/dca7b77))
* create GroupLinkStatsViewer	 ([5948c58](/../../commit/5948c58))
* add a flash partial	 ([76cb4fb](/../../commit/76cb4fb))
* customized devise controllers	 ([a1074d4](/../../commit/a1074d4))


<a name="2020-07-30"></a>
### 2020-07-30


#### Features

* create seed file for ahoy events	 ([9a7a96c](/../../commit/9a7a96c))
* show dashboard for link show page	 ([5a309af](/../../commit/5a309af))
* install view_component	 ([1574665](/../../commit/1574665))
* add unique_visit_count_grouped and visit_count_grouped stats	 ([2e55997](/../../commit/2e55997))
* install chartkick, chartjs	 ([0383e98](/../../commit/0383e98))
* tally unique visits only	 ([9b331e6](/../../commit/9b331e6))
* allow all host to connect when in development	 ([946118b](/../../commit/946118b))
* add more stats for LinkStatsViewerAction	 ([06188b9](/../../commit/06188b9))
* add dashboard resource	 ([f6f7d16](/../../commit/f6f7d16))
* add more host for dev testing	 ([09bcc80](/../../commit/09bcc80))


