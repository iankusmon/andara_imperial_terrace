# Andara Imperial Terrace

An oase Andara's application that will handle the processws of sales, rent of property, tender and also tour package features as well.

## About Andara Imperial Terrace Application

### Sales Property

Andara Imperial Terrace is your ultimate platform for seamless property sales and management. Designed to revolutionize the real estate market, it combines cutting-edge technology with strategic features to ensure properties reach their maximum sales potential.

Get ready to redefine property transactions. Join Andara Imperial Terrace today!

Key Features:
 - Efficient Property Sales
With a user-friendly interface and streamlined processes, buyers and sellers can easily connect, facilitating faster and more transparent transactions.

- Agent Affiliate Program, Expand your sales force effortlessly with our innovative agent affiliate feature.
Agents can register, promote properties, and earn competitive commissions.
This program empowers a network of affiliates to boost property visibility and drive sales.
Comprehensive Listings. Our platform hosts an extensive portfolio of properties, ensuring diverse options for buyers while maximizing exposure for sellers.

With Andara Imperial Terrace, we’re not just facilitating property sales; we’re creating opportunities for growth, innovation, and success in the real estate market. Whether you’re a seasoned professional or a new agent, this is your gateway to thriving in property sales.

Andara Imperial Terrace is your one-stop solution for handling property tenders, ensuring a smooth collaboration between property owners and constructors.

### Tender

Andara Imperial Terrace also become revolutionize the property tender process for constructors. This innovative application provides a seamless, efficient, and transparent workflow, encompassing every step from registration to tender management.

Key Features:
- Registration: Constructors can easily sign up and create a comprehensive profile that includes their credentials, certifications, and previous project portfolios.

- Verification: A robust verification system ensures that all applicants meet the required standards and criteria before participating in the tender process.

- Tender Management: The platform offers tools for managing tenders, including:

  - Publishing property tender details.
  - Allowing constructors to submit bids.
  - Providing analytics for decision-making.
  - Facilitating secure communication between stakeholders.

### Rent of Villa

Discover the pinnacle of elegance and indulgence at Andara Imperial Terrace, your ultimate destination for experiencing luxurious European villa-style living. Nestled amidst breathtaking European-inspired panoramas, we provide a haven of sophistication where every moment is tailored to perfection.

Services We Offer:
- Rooftop BBQ Delights: Savor unforgettable evenings under the stars with premium BBQ selections prepared atop our scenic rooftop terrace.
- Sushi Time: Experience authentic and exquisite sushi creations, blending tradition and modern flair, served fresh daily.
- Horsery Adventures: Embrace the thrill of equestrian activities, from guided rides to immersive horseback experiences for all skill levels.
- Archery Excellence: Unleash your inner marksman with our professional archery setups, designed for fun and precision.
- Panoramic European Views: Be enchanted by landscapes reminiscent of Europe’s finest destinations, a perfect backdrop for relaxation or memorable photos.
Whether you’re seeking a serene escape, a romantic getaway, or simply a unique retreat, Andara Imperial Terrace promises an unparalleled experience that blends leisure, luxury, and lifestyle.

Welcome to your European-inspired sanctuary.

### Tour Package

We are dedicated to crafting an Oasis Experience—a rejuvenating journey designed to boost your soul with positive energy. Whether you're exploring the cultural richness of Solo or seeking a serene escape, our tour packages guarantee the perfect blend of relaxation and adventure.

To ensure your comfort, we offer exclusive accommodation in our luxurious European-style villas, providing a unique and charming place to stay, complete with modern amenities and elegant designs that transport you to a world of sophistication.

At Andara Imperial Terrace, we aim to deliver not just tours but unforgettable experiences that leave you feeling refreshed and inspired. Come and let us guide you through the wonders of Solo Raya!

## Framwwork Used

**This app is using Rails 8.0.0 and Ruby 3.3.6**

## Main changes vs a newly generated Rails app

Here's a run down on what's different. You can also use this as a guide to
Dockerize an existing Rails app.

- **Core**:
    - Use PostgreSQL (`-d postgresql)` as the primary SQL database
    - Use Redis as the cache back-end
    - Use Sidekiq as a background worker through Active Job
    - Use a standalone Action Cable process
- **Config**:
    - Log to STDOUT so that Docker can consume and deal with log output
    - Credentials are removed (secrets are loaded in with an `.env` file)
    - Extract a bunch of configuration settings into environment variables
    - Rewrite `config/database.yml` to use environment variables
    - `.yarnc` sets a custom `node_modules/` directory
    - `config/initializers/enable_yjit.rb` to enable YJIT
    - `config/initializers/rack_mini_profiler.rb` to enable profiling Hotwire Turbo Drive
    - `config/initializers/assets.rb` references a custom `node_modules/` directory
    - `config/routes.rb` has Sidekiq's dashboard ready to be used but commented out for safety
    - `Procfile.dev` has been removed since Docker Compose handles this for us
    - Brakeman has been removed
- **Assets**:
    - Continue using Sprockets (for now)
    - Use esbuild (`-j esbuild`) and TailwindCSS (`-c tailwind`)
    - Add `postcss-import` support for `tailwindcss` by using the `--postcss` flag
    - Add ActiveStorage JavaScript package
- **Public:**
    - Custom `502.html` and `maintenance.html` pages
    - Generate favicons using modern best practices

Besides the Rails app itself, a number of new Docker related files were added
to the project which would be any file having `*docker*` in its name. Also
GitHub Actions have been set up.

## Running this app

### Installing Ruby

First, we need to install Ruby's dependencies using Homebrew.

brew install openssl@3 libyaml gmp rust
Next, we'll install Ruby using a version manager called Mise. This allows you to easily update Ruby and switch between versions anytime.

```sh
curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate)"' >> ~/.zshrc
source ~/.zshrc
Then install Ruby with Mise:
```

```sh
mise use --global ruby@3
```

Confirm that Ruby is installed and works:

```sh
ruby --version
#=> 3.3.5
```
You also want to ensure you're using the latest version of Rubygems.

```sh
gem update --system
```

Optionally, if you plan to use Node.js for handling assets, you can use Mise to install Node as well.

```sh
mise use --global node@22.11.0
node -v
#=> 22.11.0
```

### Configuring Git

We'll be using Git for our version control system so we're going to set it up to match our Github account. If you don't already have a Github account, make sure to register. It will come in handy for the future.

Replace the example name and email address in the following steps with the ones you used for your Github account.

```sh
git config --global color.ui true
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR@EMAIL.com"
ssh-keygen -t ed25519 -C "YOUR@EMAIL.com"
```

The next step is to take the newly generated SSH key and add it to your Github account. You want to copy and paste the output of the following command and paste it here.

```sh
cat ~/.ssh/id_ed25519.pub
Once you've done this, you can check and see if it worked:

ssh -T git@github.com
You should get a message like this:
```

Hi excid3! You've successfully authenticated, but GitHub does not provide shell access.

### Installing Rails

Choose the version of Rails you want to install:

```sh
8.0.0 (Recommended)
```

Installing Rails is as simple as running the following command in your Terminal:

```sh
gem install rails -v 8.0.0
```
And now we can verify Rails is installed:

```sh
rails -v
# Rails 8.0.0
```

### Setting Up A Database

*PostgreSQL*

You can install PostgreSQL server and client from Homebrew:

```sh
brew install postgresql
brew services start postgresql
```

By default the postgresql user is your current macOS username with no password. For example, my macOS user is named chris so I can login to postgresql with that username.

#### Clone this repo anywhere you want and move into the directory:

```sh
git clone https://github.com/iankusmon/andara_imperial_terrace.git
cd andara_imperial_terrace

# Optionally checkout a specific tag, such as: git checkout 0.9.0
```

```sh
rails server
or
rails s
```

You can now visit http://localhost:3000 to view your new website!


Now that you've got your machine setup, it's time to start building some Rails applications.

