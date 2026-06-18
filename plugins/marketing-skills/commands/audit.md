---
description: Audit a URL (SEO or CRO) and write an HTML findings report.
argument-hint: "[url] [seo|cro]"
---

# /audit

1. Take the URL and audit type (default: CRO for product/landing pages, SEO for
   content/category pages).
2. Run the `seo-audit` or `cro` skill accordingly.
3. Format findings with the `reporting` skill (audit template) as HTML —
   prioritized issues, impact, and fixes.
4. Write to the client's `/audits` folder and present.
