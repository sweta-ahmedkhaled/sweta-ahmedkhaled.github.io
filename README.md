# Ahmed Khaled — website

Built with [Jekyll](https://jekyllrb.com/) (same setup as Andrej Karpathy's blog) and hosted free on GitHub Pages.

## How to add a blog post

1. Add a new file to `_posts/` named `YYYY-MM-DD-your-title.md`
2. Start it with front matter:
   ```
   ---
   layout: post
   title: "Your Title"
   date: 2026-08-17
   ---
   ```
3. Write the post in markdown below the `---`.
4. `git add`, `git commit`, `git push` — GitHub rebuilds and publishes automatically within about a minute.

That's it. No build step to run yourself, no server to manage.

## How to add a research entry

1. Add a new file to `_research/` named `your-project-slug.md`
2. Start it with front matter:
   ```
   ---
   title: "Your Project Title"
   year: "2026"
   order: 1
   tagline: "One line about what it is."
   ---
   ```
   - `order` controls where it sits in the list (1 = top). Newest first.
   - `tagline` is the grey line under the title on the homepage. Optional.
3. Leave the body empty and it shows as plain text on the homepage.
   **Write anything below the front matter and the title automatically becomes a
   link** to its own page at `/research/your-project-slug/`.
4. Optional: add links to the entry's own page with
   ```
   venue: "Under review"
   links:
     - name: "Paper"
       url: "https://..."
     - name: "Code"
       url: "https://github.com/..."
   ```

Same publishing flow as posts — commit and push (or let `scripts/auto-publish.sh` do it).

## Project structure

- `_config.yml` — site title, description, and Jekyll settings
- `_layouts/default.html` — the shared page chrome (nav, social bar, footer, fonts)
- `_layouts/post.html` — wraps individual blog posts with a title/date header
- `_includes/` — nav, social bar, and footer, pulled into every page
- `index.html` — the homepage (Hero, Timeline, Research, Teaching, Blog)
- `_layouts/research.html` — wraps individual research pages
- `_posts/` — your blog posts, one markdown file each
- `_research/` — your research entries, one markdown file each
- `assets/` — CSS, images, and your resume PDF

## Previewing locally (optional)

If you have Ruby installed:

```
bundle install
bundle exec jekyll serve
```

Then open `http://localhost:4000`. Not required — you can also just push to GitHub and check the live site after it rebuilds.
# sweta-ahmedkhaled.github.io
