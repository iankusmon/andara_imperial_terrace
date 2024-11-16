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

### Rent of Property (Villa)

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

You'll need to have [Docker installed](https://docs.docker.com/get-docker/).
It's available on Windows, macOS and most distros of Linux. If you're new to
Docker and want to learn it in detail check out the [additional resources
links](#learn-more-about-docker-and-ruby-on-rails) near the bottom of this
README.

You'll also need to enable Docker Compose v2 support if you're using Docker
Desktop. On native Linux without Docker Desktop you can [install it as a plugin
to Docker](https://docs.docker.com/compose/install/linux/). It's been generally
available for a while now and is stable. This project uses specific [Docker
Compose v2
features](https://nickjanetakis.com/blog/optional-depends-on-with-docker-compose-v2-20-2)
that only work with Docker Compose v2 2.20.2+.

If you're using Windows, it will be expected that you're following along inside
of [WSL or WSL
2](https://nickjanetakis.com/blog/a-linux-dev-environment-on-windows-with-wsl-2-docker-desktop-and-more).
That's because we're going to be running shell commands. You can always modify
these commands for PowerShell if you want.

#### Clone this repo anywhere you want and move into the directory:

```sh
git clone https://github.com/nickjj/docker-rails-example hellorails
cd hellorails

# Optionally checkout a specific tag, such as: git checkout 0.9.0
```

#### Copy an example .env file because the real one is git ignored:

```sh
cp .env.example .env
```

#### Build everything:

*The first time you run this it's going to take 5-10 minutes depending on your
internet connection speed and computer's hardware specs. That's because it's
going to download a few Docker images and build the Ruby + Yarn dependencies.*

```sh
docker compose up --build
```

Now that everything is built and running we can treat it like any other Rails
app.

Did you receive a `depends_on` "Additional property required is not allowed"
error? Please update to at least Docker Compose v2.20.2+ or Docker Desktop
4.22.0+.

Did you receive an error about a port being in use? Chances are it's because
something on your machine is already running on port 8000. Check out the docs
in the `.env` file for the `DOCKER_WEB_PORT` variable to fix this.

Did you receive a permission denied error? Chances are you're running native
Linux and your `uid:gid` aren't `1000:1000` (you can verify this by running
`id`). Check out the docs in the `.env` file to customize the `UID` and `GID`
variables to fix this.

#### Setup the initial database:

```sh
# You can run this from a 2nd terminal.
./run rails db:setup
```

*We'll go over that `./run` script in a bit!*

#### Check it out in a browser:

Visit <http://localhost:8000> in your favorite browser.

#### Running the test suite:

```sh
# You can run this from the same terminal as before.
./run test
```

You can also run `./run test -b` with does the same thing but builds your JS
and CSS bundles. This could come in handy in fresh environments such as CI
where your assets haven't changed and you haven't visited the page in a
browser.

#### Static code analysis with Rubocop:

```sh
# You can run this from the same terminal as before.
./run rubocop
```

You can also run `./run rubocop --auto-correct` which will automatically
correct any issues that are auto-correctable. Alternatively the shorthand `-a`
flag does the same thing.

#### Stopping everything:

```sh
# Stop the containers and remove a few Docker related resources associated to this project.
docker compose down
```

You can start things up again with `docker compose up` and unlike the first
time it should only take seconds.



