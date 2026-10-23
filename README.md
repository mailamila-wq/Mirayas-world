# Miraya's World
A static, iPad-friendly learning website. No database or account required.

## Deploy on GitHub Pages
1. Create a new **public** GitHub repository named `mirayas-world`.
2. Upload `index.html`, `manifest.webmanifest`, `icon.svg`, and `sw.js` to the repository root.
3. Go to **Settings → Pages** and select **Deploy from a branch**, `main`, `/ (root)`; save.
4. Visit `https://YOUR-USERNAME.github.io/mirayas-world/` after deployment.
5. Open the URL in Safari on the iPad. Use Share → Add to Home Screen.

Progress is stored locally in the browser. Use Parent Corner to export and import backups. If Safari data is cleared, local progress may be lost. Progress is not synced across browsers/devices or necessarily between Safari and a Home Screen web app.

Offline support uses a service worker; visit the site online first and allow it to load before going offline. GitHub Pages is public hosting, so do not publish private personal information.
