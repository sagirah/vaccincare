---
name: Pan-African Clinical Health & Immunisation
colors:
  surface: '#fdf8ff'
  surface-dim: '#ddd5ff'
  surface-bright: '#fdf8ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f7f1ff'
  surface-container: '#f1ebff'
  surface-container-high: '#ebe5ff'
  surface-container-highest: '#e5deff'
  on-surface: '#1c163c'
  on-surface-variant: '#484554'
  inverse-surface: '#312b52'
  inverse-on-surface: '#f4eeff'
  outline: '#797586'
  outline-variant: '#c9c4d7'
  surface-tint: '#5f44d3'
  primary: '#2e0095'
  on-primary: '#ffffff'
  primary-container: '#4522b8'
  on-primary-container: '#b5a7ff'
  inverse-primary: '#cabeff'
  secondary: '#6250aa'
  on-secondary: '#ffffff'
  secondary-container: '#b09efe'
  on-secondary-container: '#423088'
  tertiary: '#003628'
  on-tertiary: '#ffffff'
  tertiary-container: '#004f3b'
  on-tertiary-container: '#51c6a0'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#e6deff'
  primary-fixed-dim: '#cabeff'
  on-primary-fixed: '#1b0062'
  on-primary-fixed-variant: '#4725ba'
  secondary-fixed: '#e6deff'
  secondary-fixed-dim: '#cbbeff'
  on-secondary-fixed: '#1d0061'
  on-secondary-fixed-variant: '#4a3890'
  tertiary-fixed: '#85f7cf'
  tertiary-fixed-dim: '#68dbb4'
  on-tertiary-fixed: '#002117'
  on-tertiary-fixed-variant: '#00513d'
  background: '#fdf8ff'
  on-background: '#1c163c'
  surface-variant: '#e5deff'
typography:
  headline-xl:
    fontFamily: Inter
    fontSize: 30px
    fontWeight: '700'
    lineHeight: 38px
    letterSpacing: -0.02em
  headline-xl-mobile:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Inter
    fontSize: 22px
    fontWeight: '700'
    lineHeight: 28px
    letterSpacing: -0.015em
  headline-md:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
    letterSpacing: -0.01em
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
    letterSpacing: 0em
  body-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: 20px
    letterSpacing: 0em
  body-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '400'
    lineHeight: 16px
    letterSpacing: 0.01em
  label-lg:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
    letterSpacing: 0.01em
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.02em
  label-sm:
    fontFamily: Inter
    fontSize: 10px
    fontWeight: '700'
    lineHeight: 14px
    letterSpacing: 0.04em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  gutter: 1rem
  margin: 1rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
---

## Brand & Style

This design system establishes an empathetic, clinical, and authoritative mobile experience crafted specifically for primary healthcare delivery across Nigeria. The brand personality balances uncompromising medical credibility with protective maternal and parental warmth. It directly addresses critical public health hurdles—low health literacy, fragmented records, and regional supply chain opacity—by presenting complex clinical schedules in an intuitive, calming, and reassuring interface.

The design movement synthesizes **Modern Healthcare Neomorphism** with **African Digital Ergonomics**:
- **Atmosphere:** Clean, sunlit, and medical without feeling sterile or intimidating. Dominated by tranquil soft lavender canvases, royal purple primary anchors, and reassuring mint and teal trust badges.
- **Ergonomics & Accessibility:** Designed for real-world device contexts, including intermittent 3G/4G connectivity, outdoor glare, and one-handed operation. All tap targets adhere strictly to a 48px baseline. Bilingual typography supports both English and Hausa, maintaining identical optical balance and vertical metrics regardless of language.
- **Visual Tone:** Soft pill geometry, gently floating elevated cards (16–24px corners), crisp high-contrast icons, and micro-badges that communicate vaccine inventory and clinical urgency at a glance.

## Colors

The palette leverages deep jewel tones combined with soothing pastels to establish immediate trust, clarity, and status differentiation:

- **Primary (`#4522B8`) & Deep Secondary (`#29116F`):** Used for primary action buttons, key callout containers, bottom navigation active states, and clinical branding headers. Conveys authority, premium craft, and institutional trust.
- **Canvas (`#F8F6FF`) & Card Surface (`#FFFFFF`):** A custom soft lavender tint serves as the root background, reducing high-key blue glare compared to raw white while letting white cards float naturally with gentle boundary contrast.
- **Subtle Surface Tint (`#EDE7FF`):** Used for non-selected chips, icon base circles, tab bar active pill backgrounds, and disabled controls.
- **Typography Spectrum:** Core text is rendered in `#201A40` (high-contrast dark navy) rather than pure black, ensuring softer yet AA/AAA-grade legibility against lavender. Secondary meta labels, clinical subtexts, and timestamps use `#77738E` (slate purple).
- **Clinical Semantic States:**
  - **Success / In-Stock (`#149B78` / `#E8F7F1`):** Complete doses, confirmed schedules, and operational facility stock.
  - **Warning / Limited Stock (`#E6A23C` / `#FEF7ED`):** Imminent timeline dates (due within 5–7 days) and low facility inventory.
  - **Error / Urgent Alert (`#D94A5A` / `#FDF2F2`):** Overdue vaccinations, disease outbreak alerts, and network errors.

## Typography

The design system standardizes on **Inter** across all typographical scales for its clinical precision, robust x-height, clear numeric apertures, and flawless rendering of Latin diacritics utilized in Hausa localization (such as ɓ, ɗ, ƙ, and ’y).

- **Headlines:** Set tightly in Bold (700) or Semi-Bold (600) with slight negative tracking to give vaccine names and patient titles prominent authority.
- **Body:** Uses regular weights (400) with generous line heights (1.4–1.5x) to prevent eye fatigue when reading clinical instructions, side effect profiles, or campaign details.
- **Labels & Badges:** Use Medium (500) and Semi-Bold (600) with slight letter-spacing to guarantee legibility on micro-tags such as stock statuses, dosage tags, and countdown pills.
- **Bilingual Considerations:** English and Hausa text lengths differ by approximately 15–20%. All layout containers preserve dynamic text wrapping without relying on fixed character truncations.

## Layout & Spacing

The layout is built upon an 8pt spatial baseline with a dense 4pt sub-grid for badge padding and precise micro-alignments:

- **Mobile Viewport Grid:** Utilizes a standard 4-column fluid layout with an edge gutter margin of `16px` (`margin`) and internal column spacing of `16px` (`gutter`).
- **Internal Card Padding:** Standard cards use `16px` (`space-md`) for content padding, extending to `20px` or `24px` (`space-lg`) on featured profile headers and hero campaign notices.
- **Vertical Flow Rhythm:** 
  - Micro-gaps between label and value: `4px` (`space-xs`).
  - Stack gaps within list groups: `8px`–`12px` (`space-sm` to `0.75rem`).
  - Section-to-section block spacing: `24px` (`1.5rem`) to maintain breathable clarity between timeline modules and actions.
- **Touch Ergonomics:** All interactive touch points enforce a minimum bounding box of 48×48px, even when visually rendering a smaller 28px icon or badge.

## Elevation & Depth

Visual hierarchy uses **tonal layering and ambient lavender-tinted shadows**, eliminating harsh black drop-shadows:

- **Level 0 (Flat Canvas):** `#F8F6FF` background canvas. Base for non-interactive content structures.
- **Level 1 (Standard Card / Resting Pill):** Crisp white surface (`#FFFFFF`) with a subtle tinted drop shadow: `0px 4px 16px rgba(69, 34, 184, 0.05)`, edged with an ultra-fine border `1px solid rgba(69, 34, 184, 0.06)`. This separates cards from the canvas in high-glare environments.
- **Level 2 (Floating Action / Active Modal / Bottom Sheet):** `0px 8px 24px rgba(41, 17, 111, 0.12)`, used for sticky action bars, bottom modal drawers, and active filter tabs.
- **Level 3 (Overlay / Alert Toast):** `0px 12px 32px rgba(41, 17, 111, 0.18)` paired with an inner top hairline reflection `1px solid rgba(255, 255, 255, 0.4)` for critical disease alerts.
- **Hero Clinical Gradients:** Key action cards (e.g., Upcoming Dose Reminder) use a deep purple gradient fill (`linear-gradient(135deg, #4522B8 0%, #29116F 100%)`) with white text and inner soft glow highlights.

## Shapes

The design system embraces a unified, organic curved language that feels friendly and protective:

- **Cards & Surface Containers:** Standardized at `16px` radius (`rounded-lg`), expanding to `20px`–`24px` for hero carousel banners and profile headers.
- **Buttons & Action Controls:** Full pill geometry (`9999px`) for primary, secondary, and filter chips, providing tactile affordance and clear tap boundaries.
- **Input Fields & Search Bars:** `12px`–`16px` radius for search and clinical form inputs, balanced with internal icon alignment.
- **Avatars & Status Indicators:** Full circles (`50%` / circular pill) for child profile portraits, dose completion checkmarks, and vaccination progress dots.

## Components

### Buttons & Quick Actions
- **Primary Button:** Full pill height 50px (minimum 48px touch target). Solid `#4522B8` background, white bold label, optional leading or trailing 20px icon. Active state darkens to `#29116F`.
- **Secondary Action Button:** Surface tint `#EDE7FF`, label in `#4522B8`, zero border.
- **Outline Action Button:** Transparent background, `1.5px` border in `#4522B8`, label in `#4522B8`.
- **Quick Icon Action Tiles:** 4-column quick action grid (e.g., "Vaccines", "Facilities", "Alerts"). Squircle container (56×56px) in `#EDE7FF`, containing `#4522B8` 24px line icon, with body-sm label underneath.

### Filter Chips & Segmented Controls
- **Segmented Tabs:** Encapsulated pill switch on `#EDE7FF` container. Active tab sits on an elevated `#4522B8` or `#FFFFFF` pill with `#201A40` or white text.
- **Filter Chips:** 36px height pill. Inactive: `#FFFFFF` border `1px solid #EDE7FF`, slate text. Selected: `#4522B8` solid fill, white text.

### Vaccine Timeline & Dose Cards
- **Dose Item Card:** White card with 16px radius, containing:
  - Left indicator: Checkmark circular badge (`#149B78` fill with white check for administered; `#EDE7FF` circle with purple clock for upcoming).
  - Center: Vaccine title (`headline-md`), scheduled administration date (`body-sm`), and disease scope subtitle.
  - Right: Action countdown tag (e.g., "In 5 days" in a `#EDE7FF` pill with `#4522B8` text) or green verification icon.
- **Connecting Rail:** Left-aligned 2px vertical stroke in `#EDE7FF` joining chronological vaccine rows.

### Child Profile Header Card
- **Structure:** Elevated card with child portrait avatar (64×64px circular, with subtle purple ring), name in `headline-lg`, age badge, and a pill-shaped quick indicator (`#E8F7F1` container with green pulse dot for "Next vaccine in 5 days"). Includes direct contextual action "View Profile >".

### Facility Stock Cards
- **Structure:** 16px rounded card showing facility name, distance (e.g., "5.2 km • Kano"), operating hours, and a dedicated **Vaccine Stock Tag**:
  - Green Tag (`#E8F7F1` fill, `#149B78` text): "Vaccine in stock".
  - Amber Tag (`#FEF7ED` fill, `#E6A23C` text): "Limited stock".
  - Includes a right-aligned pill button ("View") directing to facility details and navigation.

### Health Alerts & Outbreak Cards
- **Warning Card:** Rounded 16px surface layered with a soft red or amber border tint. Left alert icon (loudspeaker or hazard pulse), headline in `headline-md`, concise public health advisory copy, and a full-width or inline rounded button ("Learn More" / "See Eligible Age Groups").

### Navigation & App Bar
- **Top Navigation Bar:** Clean, minimal header displaying user avatar, personalized greeting ("Good Morning, Fatima"), and notification bell with an unread badge indicator.
- **Bottom Navigation Bar:** Floating white tab bar with subtle top elevation. 5 items: Home, Schedule, Facilities, Alerts, More. Active item displays icon and label in primary `#4522B8` with an optional pill indicator.