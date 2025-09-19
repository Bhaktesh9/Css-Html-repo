# HTML5 + CSS3 Practical

A modern, responsive, and accessible website built with semantic HTML5 and CSS3, containerized with Docker.

## 🌟 Features

- **Semantic HTML5**: Proper use of landmarks, headings, and semantic elements
- **Modern CSS3**: Custom properties, Flexbox, Grid, and responsive design
- **Accessibility First**: WCAG AA compliant with proper focus management
- **Dark Mode Support**: Automatic dark mode based on user preference
- **Responsive Design**: Mobile-first approach with fluid layouts
- **Docker Ready**: Containerized for easy deployment
- **Zero JavaScript**: Pure HTML/CSS implementation

## 🏗️ Project Structure

```
Lab3/
├── index.html              # Home page with welcome content
├── about.html              # About page with project history
├── media.html              # Media demonstrations (images, audio, video)
├── extras.html             # Tables and interactive elements
├── assets/
│   ├── css/
│   │   └── styles.css      # Main stylesheet with design system
│   ├── images/             # Responsive images (hero-*.jpg)
│   ├── audio/              # Audio samples (sample.mp3)
│   ├── video/              # Video content (sample.mp4)
│   └── captions/           # Video captions (sample.vtt)
├── Dockerfile              # Container configuration
├── .dockerignore           # Docker build exclusions
└── README.md               # This file
```

## 🎨 Design System

### Color Palette

**Light Mode:**
- Background: `#ffffff` (Pure white)
- Foreground: `#1a1a1a` (Near black)
- Brand: `#3b82f6` (Blue 500)
- Accent: `#8b5cf6` (Violet 500)
- Surface: `#f8fafc` (Slate 50)
- Muted: `#6b7280` (Gray 500)

**Dark Mode:**
- Background: `#0f172a` (Slate 900)
- Foreground: `#f8fafc` (Slate 50)
- Brand: `#60a5fa` (Blue 400)
- Accent: `#a78bfa` (Violet 400)
- Surface: `#1e293b` (Slate 800)
- Muted: `#94a3b8` (Slate 400)

### Typography Scale

- **Font Stack**: System fonts (-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif)
- **Monospace**: 'SFMono-Regular', Consolas, 'Liberation Mono', Menlo, Courier, monospace
- **Scale Ratio**: 1.25 (Major Third)
- **Sizes**: 0.75rem → 0.875rem → 1rem → 1.125rem → 1.25rem → 1.5rem → 1.875rem → 2.25rem

### Spacing Scale

Based on 0.25rem (4px) units:
- `--space-1`: 4px
- `--space-2`: 8px  
- `--space-3`: 12px
- `--space-4`: 16px (base)
- `--space-5`: 20px
- `--space-6`: 24px
- `--space-8`: 32px
- `--space-10`: 40px
- `--space-12`: 48px
- `--space-16`: 64px

### Responsive Breakpoints

- **Mobile**: < 480px (single column, stacked navigation)
- **Tablet**: 480px - 767px (centered navigation)
- **Desktop**: 768px+ (horizontal navigation, flex header)
- **Large**: 1024px+ (CSS Grid layouts, two-column content)
- **XL**: 1280px+ (maximum content width)

## 🎯 Components

### Cards
Elevated surfaces with subtle shadows and hover effects:
```css
.card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-lg);
  padding: var(--space-6);
  box-shadow: var(--shadow-sm);
}
```

### Tables
Responsive tables with striped rows and sticky headers:
- Horizontal scroll on mobile
- Hover effects on rows
- Semantic caption and scope attributes

### Media Elements
- Responsive images using `<picture>` elements
- Accessible video with captions
- Styled audio controls

### Interactive Elements
- `<details>` / `<summary>` for progressive disclosure
- `<progress>` and `<meter>` elements
- Focus management and keyboard navigation

## ♿ Accessibility Features

### WCAG AA Compliance
- **Color Contrast**: 4.5:1 minimum for normal text, 3:1 for large text
- **Focus Management**: Visible focus indicators on all interactive elements
- **Skip Links**: "Skip to content" link for keyboard users
- **Semantic Structure**: Proper heading hierarchy and landmarks

### Inclusive Design
- **Reduced Motion**: Respects `prefers-reduced-motion` setting
- **High Contrast**: Supports `prefers-contrast: high`
- **Screen Reader Support**: ARIA labels and semantic HTML
- **Keyboard Navigation**: Full keyboard accessibility

### Testing Checklist
- [x] All images have descriptive alt text
- [x] Video includes captions
- [x] Forms have proper labels
- [x] Color is not the only means of conveying information
- [x] Interactive elements are keyboard accessible
- [x] Skip links are functional

## 🐳 Docker Deployment

### Quick Start

Build and run the container:

```bash
# Build the image
docker build -t bhaktesh9/html5-css3-site:latest .

# Run on localhost:8080
docker run --rm -p 8080:80 bhaktesh9/html5-css3-site:latest
```

### Production Deployment

```bash
# Build with specific tag
docker build -t bhaktesh9/html5-css3-site:v1.0 .

# Tag as latest
docker tag bhaktesh9/html5-css3-site:v1.0 bhaktesh9/html5-css3-site:latest

# Push to registry
docker login
docker push bhaktesh9/html5-css3-site:v1.0
docker push bhaktesh9/html5-css3-site:latest

# Deploy (example with custom port)
docker run -d --name html5-practical -p 3000:80 bhaktesh9/html5-css3-site:latest
```

### Health Check

The container includes a health check that verifies the web server is responding:

```bash
# Check container health
docker ps
# Look for "(healthy)" status

# Manual health check
docker exec <container-id> wget -qO- http://localhost:80/ >/dev/null && echo "Healthy"
```

### Container Details

- **Base Image**: `nginx:alpine` (lightweight, secure)
- **Size**: ~25MB (including content)
- **Ports**: Exposes port 80
- **Health Check**: HTTP GET to `/` every 30 seconds
- **Security**: Runs as non-root user (nginx default)

## 🚀 Development

### Local Development

No build process required - open HTML files directly in browser or use a local server:

```bash
# Using Python
python -m http.server 8000

# Using Node.js
npx serve .

# Using PHP
php -S localhost:8000
```

### Code Quality

- **CSS Organization**: Logical sections with comments
- **Naming Convention**: BEM-inspired utility classes
- **Performance**: Under 50KB total CSS size
- **Validation**: HTML5 and CSS3 valid markup

### Browser Support

- **Modern Browsers**: Chrome 90+, Firefox 88+, Safari 14+, Edge 90+
- **Features Used**: CSS Grid, Flexbox, Custom Properties, :focus-visible
- **Fallbacks**: Graceful degradation for older browsers

## 📊 Performance

### Lighthouse Scores (Target)
- **Performance**: ≥90
- **Accessibility**: ≥95
- **Best Practices**: ≥90
- **SEO**: ≥90

### Optimization Techniques
- **Images**: Responsive images with multiple sizes
- **CSS**: Single stylesheet, critical CSS inlined
- **Fonts**: System font stack (no web font loading)
- **Caching**: Nginx default cache headers

## 🔗 Links

- **Live Demo**: [GitHub Pages](https://bhaktesh9.github.io/html-css-lab3/)
- **Repository**: [GitHub](https://github.com/bhaktesh9/html-css-lab3)
- **Docker Hub**: [bhaktesh9/html5-css3-site](https://hub.docker.com/r/bhaktesh9/html5-css3-site)

**Author**: Bhaktesh Patel  
**Course**: HTML5 + CSS3 + Docker Practical  
**Date**: September 2025

