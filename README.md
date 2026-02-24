<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ARC-Hyperland — Iron Man Hyprland Setup</title>
<link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@300;400;500;600;700&family=Share+Tech+Mono&family=Orbitron:wght@400;600;800;900&display=swap" rel="stylesheet">
<style>
  :root {
    --arc: #00bfff;
    --arc-dim: #0077aa;
    --arc-glow: rgba(0, 191, 255, 0.35);
    --arc-faint: rgba(0, 191, 255, 0.08);
    --gold: #ffb347;
    --red: #c0392b;
    --bg: #03090f;
    --bg2: #060d18;
    --surface: rgba(0,191,255,0.04);
    --border: rgba(0, 191, 255, 0.18);
    --text: #c8e8f8;
    --text-dim: #5a8ba8;
  }

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  html { scroll-behavior: smooth; }

  body {
    background: var(--bg);
    color: var(--text);
    font-family: 'Rajdhani', sans-serif;
    font-size: 16px;
    line-height: 1.6;
    overflow-x: hidden;
    min-height: 100vh;
  }

  /* ─── GRID BACKGROUND ─── */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background-image:
      linear-gradient(rgba(0,191,255,0.04) 1px, transparent 1px),
      linear-gradient(90deg, rgba(0,191,255,0.04) 1px, transparent 1px);
    background-size: 40px 40px;
    pointer-events: none;
    z-index: 0;
  }

  body::after {
    content: '';
    position: fixed;
    inset: 0;
    background: radial-gradient(ellipse 80% 60% at 50% 0%, rgba(0,100,180,0.12) 0%, transparent 70%);
    pointer-events: none;
    z-index: 0;
  }

  .wrap {
    position: relative;
    z-index: 1;
    max-width: 960px;
    margin: 0 auto;
    padding: 0 24px 80px;
  }

  /* ─── SCANLINE OVERLAY ─── */
  .scanline {
    position: fixed;
    inset: 0;
    background: repeating-linear-gradient(
      0deg,
      transparent,
      transparent 2px,
      rgba(0,0,0,0.06) 2px,
      rgba(0,0,0,0.06) 4px
    );
    pointer-events: none;
    z-index: 999;
  }

  /* ─── HERO ─── */
  .hero {
    padding: 80px 0 48px;
    text-align: center;
    position: relative;
  }

  .arc-reactor {
    width: 110px;
    height: 110px;
    margin: 0 auto 32px;
    position: relative;
  }

  .arc-reactor svg {
    width: 100%;
    height: 100%;
    animation: reactor-spin 12s linear infinite;
    filter: drop-shadow(0 0 12px var(--arc)) drop-shadow(0 0 28px var(--arc));
  }

  .arc-reactor .core {
    position: absolute;
    inset: 50%;
    transform: translate(-50%, -50%);
    width: 30px;
    height: 30px;
    background: radial-gradient(circle, #fff 0%, var(--arc) 40%, transparent 70%);
    border-radius: 50%;
    animation: core-pulse 2s ease-in-out infinite;
    filter: blur(1px);
  }

  @keyframes reactor-spin {
    from { transform: rotate(0deg); }
    to { transform: rotate(360deg); }
  }

  @keyframes core-pulse {
    0%, 100% { opacity: 1; transform: translate(-50%, -50%) scale(1); }
    50% { opacity: 0.7; transform: translate(-50%, -50%) scale(1.3); }
  }

  .hero-title {
    font-family: 'Orbitron', monospace;
    font-size: clamp(2.4rem, 6vw, 4.2rem);
    font-weight: 900;
    letter-spacing: 0.1em;
    color: #fff;
    text-shadow: 0 0 20px var(--arc), 0 0 60px var(--arc-dim);
    animation: fadein 1s ease both;
  }

  .hero-sub {
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.85rem;
    color: var(--arc);
    letter-spacing: 0.3em;
    margin-top: 10px;
    animation: fadein 1.2s ease both;
  }

  .hero-desc {
    margin-top: 18px;
    font-size: 1.1rem;
    color: var(--text-dim);
    letter-spacing: 0.05em;
    animation: fadein 1.4s ease both;
  }

  .badge-row {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px;
    margin-top: 28px;
    animation: fadein 1.6s ease both;
  }

  .badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 5px 14px;
    border: 1px solid var(--border);
    border-radius: 2px;
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.72rem;
    color: var(--arc);
    background: var(--arc-faint);
    letter-spacing: 0.1em;
    position: relative;
    overflow: hidden;
  }

  .badge::before {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(90deg, transparent, rgba(0,191,255,0.1), transparent);
    transform: translateX(-100%);
    animation: badge-shine 3s ease infinite;
  }

  @keyframes badge-shine {
    0% { transform: translateX(-100%); }
    60%, 100% { transform: translateX(200%); }
  }

  .badge .dot {
    width: 6px; height: 6px;
    border-radius: 50%;
    background: var(--arc);
    box-shadow: 0 0 6px var(--arc);
    animation: core-pulse 2s ease-in-out infinite;
  }

  /* ─── DIVIDER ─── */
  .hud-divider {
    display: flex;
    align-items: center;
    gap: 12px;
    margin: 48px 0 32px;
    opacity: 0.6;
  }

  .hud-divider .line {
    flex: 1;
    height: 1px;
    background: linear-gradient(90deg, transparent, var(--arc), transparent);
  }

  .hud-divider .label {
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.65rem;
    color: var(--arc);
    letter-spacing: 0.3em;
    white-space: nowrap;
  }

  /* ─── SECTION ─── */
  .section {
    margin-bottom: 56px;
    animation: fadein 0.8s ease both;
  }

  .section-title {
    font-family: 'Orbitron', monospace;
    font-size: 1rem;
    font-weight: 700;
    color: var(--arc);
    letter-spacing: 0.25em;
    text-transform: uppercase;
    margin-bottom: 24px;
    display: flex;
    align-items: center;
    gap: 14px;
  }

  .section-title::before {
    content: '';
    display: inline-block;
    width: 22px;
    height: 2px;
    background: var(--arc);
    box-shadow: 0 0 8px var(--arc);
  }

  .section-title .icon {
    font-size: 1.1rem;
  }

  /* ─── PREVIEW BOX ─── */
  .preview-box {
    border: 1px solid var(--border);
    border-radius: 4px;
    background: var(--surface);
    position: relative;
    overflow: hidden;
    padding: 56px 24px;
    text-align: center;
  }

  .preview-box::before {
    content: '';
    position: absolute;
    inset: 0;
    background:
      linear-gradient(135deg, rgba(0,191,255,0.06) 0%, transparent 50%),
      linear-gradient(225deg, rgba(255,179,71,0.04) 0%, transparent 50%);
  }

  .preview-box .corner {
    position: absolute;
    width: 14px; height: 14px;
    border-color: var(--arc);
    border-style: solid;
    opacity: 0.7;
  }

  .preview-box .corner.tl { top: 8px; left: 8px; border-width: 2px 0 0 2px; }
  .preview-box .corner.tr { top: 8px; right: 8px; border-width: 2px 2px 0 0; }
  .preview-box .corner.bl { bottom: 8px; left: 8px; border-width: 0 0 2px 2px; }
  .preview-box .corner.br { bottom: 8px; right: 8px; border-width: 0 2px 2px 0; }

  .preview-placeholder {
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.75rem;
    color: var(--text-dim);
    letter-spacing: 0.2em;
  }

  .preview-placeholder .p-icon {
    font-size: 2.5rem;
    display: block;
    margin-bottom: 12px;
    opacity: 0.3;
  }

  /* ─── FEATURES GRID ─── */
  .feat-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
    gap: 14px;
  }

  .feat-card {
    border: 1px solid var(--border);
    border-radius: 3px;
    padding: 16px 18px;
    background: var(--surface);
    display: flex;
    align-items: flex-start;
    gap: 12px;
    transition: border-color 0.25s, box-shadow 0.25s, background 0.25s;
    position: relative;
    overflow: hidden;
  }

  .feat-card::after {
    content: '';
    position: absolute;
    bottom: 0; left: 0;
    height: 1px;
    width: 0;
    background: var(--arc);
    transition: width 0.35s ease;
    box-shadow: 0 0 8px var(--arc);
  }

  .feat-card:hover {
    border-color: rgba(0,191,255,0.45);
    box-shadow: 0 0 18px rgba(0,191,255,0.1);
    background: rgba(0,191,255,0.07);
  }

  .feat-card:hover::after { width: 100%; }

  .feat-icon { font-size: 1.4rem; flex-shrink: 0; line-height: 1; }

  .feat-text { font-size: 0.93rem; color: var(--text); line-height: 1.4; }

  /* ─── ENV TABLE ─── */
  .env-table {
    width: 100%;
    border-collapse: collapse;
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.82rem;
  }

  .env-table tr {
    border-bottom: 1px solid rgba(0,191,255,0.08);
    transition: background 0.2s;
  }

  .env-table tr:hover { background: var(--arc-faint); }

  .env-table th {
    text-align: left;
    padding: 10px 16px;
    color: var(--arc);
    letter-spacing: 0.2em;
    font-size: 0.72rem;
    text-transform: uppercase;
    border-bottom: 1px solid var(--border);
  }

  .env-table td {
    padding: 10px 16px;
    color: var(--text);
  }

  .env-table td:last-child {
    color: var(--arc);
    text-align: right;
  }

  .env-table td .tag {
    display: inline-block;
    padding: 2px 10px;
    background: var(--arc-faint);
    border: 1px solid var(--border);
    border-radius: 2px;
    color: var(--arc);
  }

  /* ─── KEYBIND TABLE ─── */
  .key-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 10px;
  }

  @media (max-width: 600px) { .key-grid { grid-template-columns: 1fr; } }

  .key-row {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px 14px;
    border: 1px solid var(--border);
    border-radius: 3px;
    background: var(--surface);
    transition: background 0.2s, border-color 0.2s;
    gap: 12px;
  }

  .key-row:hover {
    background: rgba(0,191,255,0.07);
    border-color: rgba(0,191,255,0.4);
  }

  .key-combo {
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.72rem;
    color: var(--arc);
    white-space: nowrap;
    display: flex;
    gap: 4px;
    align-items: center;
    flex-shrink: 0;
  }

  .key-combo .k {
    background: rgba(0,191,255,0.1);
    border: 1px solid rgba(0,191,255,0.3);
    border-radius: 3px;
    padding: 1px 6px;
  }

  .key-action {
    font-size: 0.82rem;
    color: var(--text-dim);
    text-align: right;
  }

  /* ─── CODE BLOCK ─── */
  pre {
    background: rgba(0,0,0,0.4);
    border: 1px solid var(--border);
    border-left: 3px solid var(--arc);
    border-radius: 3px;
    padding: 18px 20px;
    overflow-x: auto;
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.8rem;
    color: #8dd7f0;
    line-height: 1.7;
    position: relative;
  }

  pre::before {
    content: '> SHELL';
    position: absolute;
    top: 8px; right: 12px;
    font-size: 0.6rem;
    color: var(--arc-dim);
    letter-spacing: 0.2em;
    opacity: 0.5;
  }

  /* ─── STEPS ─── */
  .install-steps {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }

  .step {
    display: flex;
    gap: 20px;
    align-items: flex-start;
  }

  .step-num {
    font-family: 'Orbitron', monospace;
    font-size: 1.5rem;
    font-weight: 900;
    color: rgba(0,191,255,0.2);
    line-height: 1;
    min-width: 32px;
    padding-top: 4px;
  }

  .step-body { flex: 1; }

  .step-title {
    font-family: 'Orbitron', monospace;
    font-size: 0.8rem;
    color: var(--arc);
    letter-spacing: 0.2em;
    margin-bottom: 10px;
  }

  /* ─── FOLDER TREE ─── */
  .tree {
    background: rgba(0,0,0,0.4);
    border: 1px solid var(--border);
    border-radius: 3px;
    padding: 20px 24px;
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.8rem;
    line-height: 2;
    color: var(--text-dim);
  }

  .tree .folder { color: var(--arc); }
  .tree .file { color: #7ab5cc; }
  .tree .tree-arrow { color: rgba(0,191,255,0.3); }

  /* ─── ROADMAP ─── */
  .roadmap-list {
    display: flex;
    flex-direction: column;
    gap: 10px;
  }

  .roadmap-item {
    display: flex;
    align-items: center;
    gap: 14px;
    padding: 12px 16px;
    border: 1px solid var(--border);
    border-radius: 3px;
    background: var(--surface);
    font-size: 0.95rem;
    transition: border-color 0.2s;
  }

  .roadmap-item:hover { border-color: rgba(0,191,255,0.4); }

  .roadmap-check {
    width: 18px; height: 18px;
    border: 1.5px solid var(--arc-dim);
    border-radius: 2px;
    flex-shrink: 0;
    display: flex; align-items: center; justify-content: center;
    font-size: 0.7rem;
    color: var(--arc);
  }

  .roadmap-check.done {
    background: var(--arc-faint);
    border-color: var(--arc);
  }

  /* ─── AUTHOR ─── */
  .author-card {
    border: 1px solid var(--border);
    border-radius: 4px;
    background: var(--surface);
    padding: 28px 28px;
    display: flex;
    align-items: center;
    gap: 24px;
    position: relative;
    overflow: hidden;
  }

  .author-card::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 2px;
    background: linear-gradient(90deg, transparent, var(--arc), var(--gold), var(--arc), transparent);
    animation: shimmer 3s linear infinite;
  }

  @keyframes shimmer {
    0% { opacity: 0.4; }
    50% { opacity: 1; }
    100% { opacity: 0.4; }
  }

  .author-avatar {
    width: 60px; height: 60px;
    border-radius: 50%;
    border: 2px solid var(--arc);
    background: radial-gradient(circle at 40% 40%, rgba(0,191,255,0.3), rgba(0,30,60,0.8));
    display: flex; align-items: center; justify-content: center;
    font-size: 1.6rem;
    box-shadow: 0 0 20px rgba(0,191,255,0.3);
    flex-shrink: 0;
  }

  .author-name {
    font-family: 'Orbitron', monospace;
    font-size: 1rem;
    font-weight: 700;
    color: #fff;
    margin-bottom: 4px;
  }

  .author-tags {
    display: flex; flex-wrap: wrap; gap: 6px; margin-top: 8px;
  }

  .author-tag {
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.65rem;
    color: var(--arc-dim);
    letter-spacing: 0.1em;
  }

  .author-tag + .author-tag::before { content: '· '; }

  .author-link {
    margin-top: 10px;
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.75rem;
    color: var(--arc);
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 6px;
    transition: color 0.2s;
  }

  .author-link:hover { color: #fff; }

  /* ─── STAR CTA ─── */
  .star-cta {
    text-align: center;
    padding: 36px;
    border: 1px solid var(--border);
    border-radius: 4px;
    background: var(--surface);
    position: relative;
    overflow: hidden;
  }

  .star-cta::before {
    content: '';
    position: absolute;
    inset: 0;
    background: radial-gradient(ellipse at 50% 100%, rgba(0,191,255,0.06) 0%, transparent 70%);
  }

  .star-cta p {
    font-family: 'Orbitron', monospace;
    font-size: 0.85rem;
    color: var(--arc);
    letter-spacing: 0.2em;
    margin-bottom: 6px;
  }

  .star-cta .star-text {
    font-size: 1.5rem;
    margin-top: 10px;
    animation: core-pulse 2s ease-in-out infinite;
    display: inline-block;
  }

  /* ─── NOTE BOX ─── */
  .note-box {
    border-left: 3px solid var(--gold);
    background: rgba(255,179,71,0.05);
    border-top: 1px solid rgba(255,179,71,0.15);
    border-right: 1px solid rgba(255,179,71,0.1);
    border-bottom: 1px solid rgba(255,179,71,0.1);
    padding: 16px 20px;
    border-radius: 0 3px 3px 0;
  }

  .note-box .note-title {
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.7rem;
    color: var(--gold);
    letter-spacing: 0.2em;
    margin-bottom: 8px;
  }

  .note-box ul {
    list-style: none;
    display: flex;
    flex-direction: column;
    gap: 4px;
    font-size: 0.9rem;
    color: var(--text-dim);
  }

  .note-box li::before { content: '— '; color: var(--gold); opacity: 0.5; }

  /* ─── UTIL ─── */
  .cmd-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
    gap: 12px;
  }

  .cmd-card {
    border: 1px solid var(--border);
    border-radius: 3px;
    overflow: hidden;
  }

  .cmd-card .cmd-label {
    padding: 8px 14px;
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.65rem;
    color: var(--arc-dim);
    letter-spacing: 0.2em;
    background: rgba(0,191,255,0.05);
    border-bottom: 1px solid var(--border);
  }

  .cmd-card pre {
    border: none;
    border-left: none;
    border-radius: 0;
    padding: 12px 14px;
  }

  .cmd-card pre::before { display: none; }

  @keyframes fadein {
    from { opacity: 0; transform: translateY(16px); }
    to { opacity: 1; transform: translateY(0); }
  }

  /* ─── FOOTER ─── */
  .footer {
    text-align: center;
    padding: 40px 0 20px;
    font-family: 'Share Tech Mono', monospace;
    font-size: 0.65rem;
    color: var(--text-dim);
    letter-spacing: 0.2em;
    opacity: 0.4;
  }
</style>
</head>
<body>
<div class="scanline"></div>

<div class="wrap">

  <!-- ─── HERO ─── -->
  <div class="hero">
    <div class="arc-reactor">
      <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
        <circle cx="50" cy="50" r="44" fill="none" stroke="rgba(0,191,255,0.15)" stroke-width="1"/>
        <circle cx="50" cy="50" r="36" fill="none" stroke="rgba(0,191,255,0.2)" stroke-width="0.5"/>
        <polygon points="50,12 58,30 77,30 63,42 68,62 50,50 32,62 37,42 23,30 42,30" fill="none" stroke="#00bfff" stroke-width="1.5"/>
        <circle cx="50" cy="50" r="10" fill="none" stroke="#00bfff" stroke-width="1.5"/>
        <circle cx="50" cy="50" r="22" fill="none" stroke="rgba(0,191,255,0.4)" stroke-width="0.8" stroke-dasharray="4 3"/>
        <circle cx="50" cy="50" r="44" fill="none" stroke="rgba(0,191,255,0.25)" stroke-width="1" stroke-dasharray="1 3"/>
      </svg>
      <div class="core"></div>
    </div>

    <h1 class="hero-title">ARC-HYPERLAND</h1>
    <div class="hero-sub">IRON MAN INSPIRED HYPRLAND SETUP FOR ARCH LINUX</div>
    <div class="hero-desc">Minimal &nbsp;·&nbsp; Reactive &nbsp;·&nbsp; Clean &nbsp;·&nbsp; Fully Automated</div>

    <div class="badge-row">
      <span class="badge"><span class="dot"></span> Hyprland 0.53.3</span>
      <span class="badge"><span class="dot"></span> Arc Reactor Theme</span>
      <span class="badge"><span class="dot"></span> Arch Linux</span>
      <span class="badge"><span class="dot"></span> Wayland Native</span>
      <span class="badge"><span class="dot"></span> MIT License</span>
    </div>
  </div>

  <!-- ─── PREVIEW ─── -->
  <div class="hud-divider"><div class="line"></div><div class="label">// SYSTEM PREVIEW</div><div class="line"></div></div>

  <div class="section">
    <div class="section-title"><span class="icon">🖥</span> Desktop Preview</div>
    <div class="preview-box">
      <div class="corner tl"></div>
      <div class="corner tr"></div>
      <div class="corner bl"></div>
      <div class="corner br"></div>
      <div class="preview-placeholder">
        <span class="p-icon">⬡</span>
        SCREENSHOT PENDING<br>
        <span style="opacity:0.4;font-size:0.65rem">Add <code>assets/preview.png</code> to repository</span>
      </div>
    </div>
  </div>

  <!-- ─── FEATURES ─── -->
  <div class="hud-divider"><div class="line"></div><div class="label">// FEATURE MANIFEST</div><div class="line"></div></div>

  <div class="section">
    <div class="section-title"><span class="icon">⚡</span> Features</div>
    <div class="feat-grid">
      <div class="feat-card"><span class="feat-icon">⚡</span><span class="feat-text">Hyprland 0.53.3 Compatible</span></div>
      <div class="feat-card"><span class="feat-icon">🔵</span><span class="feat-text">Arc Reactor Blue HUD Theme</span></div>
      <div class="feat-card"><span class="feat-icon">🧠</span><span class="feat-text">Dynamic Rofi Theme Switcher</span></div>
      <div class="feat-card"><span class="feat-icon">🖼️</span><span class="feat-text">Wallpaper Picker with Thumbnails</span></div>
      <div class="feat-card"><span class="feat-icon">🔒</span><span class="feat-text">Styled Hyprlock Lockscreen</span></div>
      <div class="feat-card"><span class="feat-icon">📊</span><span class="feat-text">Waybar Iron Man HUD</span></div>
      <div class="feat-card"><span class="feat-icon">🔋</span><span class="feat-text">Battery, CPU, Memory Modules</span></div>
      <div class="feat-card"><span class="feat-icon">🎛️</span><span class="feat-text">Wlogout Power Menu</span></div>
      <div class="feat-card"><span class="feat-icon">👆</span><span class="feat-text">3-Finger Workspace Gestures</span></div>
      <div class="feat-card"><span class="feat-icon">🚀</span><span class="feat-text">One-Command Install Script</span></div>
      <div class="feat-card"><span class="feat-icon">🧩</span><span class="feat-text">Modular Config Structure</span></div>
      <div class="feat-card"><span class="feat-icon">💎</span><span class="feat-text">Blur requires GPU drivers only</span></div>
    </div>
  </div>

  <!-- ─── ENVIRONMENT ─── -->
  <div class="hud-divider"><div class="line"></div><div class="label">// SYSTEM ENVIRONMENT</div><div class="line"></div></div>

  <div class="section">
    <div class="section-title"><span class="icon">🖥</span> Environment</div>
    <table class="env-table">
      <thead>
        <tr><th>Component</th><th>Value</th></tr>
      </thead>
      <tbody>
        <tr><td>OS</td><td><span class="tag">Arch Linux</span></td></tr>
        <tr><td>Window Manager</td><td><span class="tag">Hyprland 0.53.3</span></td></tr>
        <tr><td>Status Bar</td><td><span class="tag">Waybar</span></td></tr>
        <tr><td>App Launcher</td><td><span class="tag">Rofi</span></td></tr>
        <tr><td>Screen Lock</td><td><span class="tag">Hyprlock</span></td></tr>
        <tr><td>Idle Daemon</td><td><span class="tag">Hypridle</span></td></tr>
        <tr><td>Wallpaper</td><td><span class="tag">swww</span></td></tr>
        <tr><td>Terminal</td><td><span class="tag">Kitty</span></td></tr>
        <tr><td>Shell</td><td><span class="tag">Zsh</span></td></tr>
      </tbody>
    </table>
  </div>

  <!-- ─── KEYBINDINGS ─── -->
  <div class="hud-divider"><div class="line"></div><div class="label">// INPUT BINDINGS</div><div class="line"></div></div>

  <div class="section">
    <div class="section-title"><span class="icon">🎮</span> Keybindings</div>
    <div class="key-grid">
      <div class="key-row"><span class="key-combo"><span class="k">SUPER</span>+<span class="k">RETURN</span></span><span class="key-action">Open Kitty</span></div>
      <div class="key-row"><span class="key-combo"><span class="k">SUPER</span>+<span class="k">E</span></span><span class="key-action">File Manager</span></div>
      <div class="key-row"><span class="key-combo"><span class="k">SUPER</span>+<span class="k">SPACE</span></span><span class="key-action">App Launcher</span></div>
      <div class="key-row"><span class="key-combo"><span class="k">SUPER</span>+<span class="k">SHIFT</span>+<span class="k">A</span></span><span class="key-action">Rofi Theme Switcher</span></div>
      <div class="key-row"><span class="key-combo"><span class="k">SUPER</span>+<span class="k">W</span></span><span class="key-action">Wallpaper Picker</span></div>
      <div class="key-row"><span class="key-combo"><span class="k">SUPER</span>+<span class="k">SHIFT</span>+<span class="k">E</span></span><span class="key-action">Power Menu</span></div>
      <div class="key-row"><span class="key-combo"><span class="k">SUPER</span>+<span class="k">Q</span></span><span class="key-action">Close Window</span></div>
      <div class="key-row"><span class="key-combo"><span class="k">SUPER</span>+<span class="k">F</span></span><span class="key-action">Fullscreen</span></div>
      <div class="key-row"><span class="key-combo"><span class="k">SUPER</span>+<span class="k">H/J/K/L</span></span><span class="key-action">Move Focus (Vim)</span></div>
      <div class="key-row"><span class="key-combo"><span class="k">SUPER</span>+<span class="k">SHIFT</span>+<span class="k">H/J/K/L</span></span><span class="key-action">Move Window</span></div>
    </div>
  </div>

  <!-- ─── INSTALLATION ─── -->
  <div class="hud-divider"><div class="line"></div><div class="label">// DEPLOYMENT SEQUENCE</div><div class="line"></div></div>

  <div class="section">
    <div class="section-title"><span class="icon">🚀</span> Installation</div>
    <div class="install-steps">
      <div class="step">
        <div class="step-num">01</div>
        <div class="step-body">
          <div class="step-title">CLONE REPOSITORY</div>
          <pre>git clone https://github.com/Arunachalam-gojosaturo/ARC-hyperland.git
cd ARC-hyperland</pre>
        </div>
      </div>
      <div class="step">
        <div class="step-num">02</div>
        <div class="step-body">
          <div class="step-title">RUN INSTALLER</div>
          <pre>chmod +x install.sh
./install.sh</pre>
        </div>
      </div>
      <div class="step">
        <div class="step-num">03</div>
        <div class="step-body">
          <div class="step-title">INSTALLER ACTIONS</div>
          <div class="note-box" style="border-left-color: var(--arc); background: var(--arc-faint); border-top-color: var(--border); border-right-color: var(--border); border-bottom-color: var(--border);">
            <div class="note-title" style="color: var(--arc)">// AUTOMATED SEQUENCE</div>
            <ul>
              <li>Install required packages via pacman</li>
              <li>Backup existing config files safely</li>
              <li>Copy all dotfiles to correct locations</li>
              <li>Setup 3-finger gesture support</li>
              <li>Enable and start system services</li>
              <li>Reload Hyprland compositor</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="step">
        <div class="step-num">04</div>
        <div class="step-body">
          <div class="step-title">MANUAL PACKAGE INSTALL (OPTIONAL)</div>
          <pre>sudo pacman -S --needed - &lt; packages.txt</pre>
        </div>
      </div>
    </div>
  </div>

  <!-- ─── WALLPAPER SYSTEM ─── -->
  <div class="hud-divider"><div class="line"></div><div class="label">// WALLPAPER SYSTEM</div><div class="line"></div></div>

  <div class="section">
    <div class="section-title"><span class="icon">🖼️</span> Wallpaper System</div>
    <div style="display:grid; grid-template-columns: 1fr 1fr; gap: 16px;">
      <div>
        <div style="font-family:'Share Tech Mono',monospace; font-size:0.7rem; color:var(--arc-dim); letter-spacing:0.2em; margin-bottom:10px;">// TRIGGER</div>
        <pre style="border-left-color: var(--gold);">SUPER + W</pre>
        <div style="font-family:'Share Tech Mono',monospace; font-size:0.7rem; color:var(--arc-dim); letter-spacing:0.2em; margin:16px 0 10px;">// WALLPAPER PATH</div>
        <pre>~/Pictures/Wallpapers/IronMan</pre>
      </div>
      <div>
        <div style="font-family:'Share Tech Mono',monospace; font-size:0.7rem; color:var(--arc-dim); letter-spacing:0.2em; margin-bottom:10px;">// SUPPORTED FORMATS</div>
        <div class="feat-card" style="flex-direction:column; gap:6px;">
          <div style="font-family:'Share Tech Mono',monospace; font-size:0.8rem; color:var(--arc);">.jpg &nbsp;·&nbsp; .jpeg &nbsp;·&nbsp; .png</div>
          <div style="font-size:0.8rem; color:var(--text-dim);">ImageMagick thumbnail generation</div>
          <div style="font-size:0.8rem; color:var(--text-dim);">swww animated transitions</div>
        </div>
      </div>
    </div>
  </div>

  <!-- ─── FOLDER STRUCTURE ─── -->
  <div class="hud-divider"><div class="line"></div><div class="label">// FILE SYSTEM</div><div class="line"></div></div>

  <div class="section">
    <div class="section-title"><span class="icon">📂</span> Folder Structure</div>
    <div class="tree">
      <div><span class="folder">ARC-hyperland/</span></div>
      <div><span class="tree-arrow">│</span></div>
      <div><span class="tree-arrow">├── </span><span class="folder">hypr/</span></div>
      <div><span class="tree-arrow">│   ├── </span><span class="file">hyprland.conf</span></div>
      <div><span class="tree-arrow">│   ├── </span><span class="file">hyprlock.conf</span></div>
      <div><span class="tree-arrow">│   ├── </span><span class="file">hypridle.conf</span></div>
      <div><span class="tree-arrow">│   ├── </span><span class="file">ironman-theme.conf</span></div>
      <div><span class="tree-arrow">│   └── </span><span class="folder">scripts/</span></div>
      <div><span class="tree-arrow">│</span></div>
      <div><span class="tree-arrow">├── </span><span class="folder">waybar/</span></div>
      <div><span class="tree-arrow">│   ├── </span><span class="file">config.jsonc</span></div>
      <div><span class="tree-arrow">│   └── </span><span class="file">style.css</span></div>
      <div><span class="tree-arrow">│</span></div>
      <div><span class="tree-arrow">├── </span><span class="folder">rofi/</span><span style="color:rgba(0,191,255,0.3)"> └── scripts/</span></div>
      <div><span class="tree-arrow">├── </span><span class="folder">wlogout/</span></div>
      <div><span class="tree-arrow">│</span></div>
      <div><span class="tree-arrow">├── </span><span class="file">install.sh</span></div>
      <div><span class="tree-arrow">├── </span><span class="file">packages.txt</span></div>
      <div><span class="tree-arrow">└── </span><span class="file">README.md</span></div>
    </div>
  </div>

  <!-- ─── USEFUL COMMANDS ─── -->
  <div class="hud-divider"><div class="line"></div><div class="label">// COMMAND REFERENCE</div><div class="line"></div></div>

  <div class="section">
    <div class="section-title"><span class="icon">🔧</span> Useful Commands</div>
    <div class="cmd-grid">
      <div class="cmd-card">
        <div class="cmd-label">// RELOAD HYPRLAND</div>
        <pre>hyprctl reload</pre>
      </div>
      <div class="cmd-card">
        <div class="cmd-label">// RESTART WAYBAR</div>
        <pre>pkill waybar && waybar &</pre>
      </div>
      <div class="cmd-card">
        <div class="cmd-label">// CHECK KEYBINDS</div>
        <pre>hyprctl binds</pre>
      </div>
    </div>
  </div>

  <!-- ─── NOTES ─── -->
  <div class="hud-divider"><div class="line"></div><div class="label">// SYSTEM NOTES</div><div class="line"></div></div>

  <div class="section">
    <div class="section-title"><span class="icon">⚠️</span> Notes</div>
    <div class="note-box">
      <div class="note-title">// REQUIREMENTS & LIMITATIONS</div>
      <ul>
        <li>Designed specifically for Arch Linux</li>
        <li>Wayland only — no X11 support</li>
        <li>Blur effects require proper GPU drivers</li>
        <li>Tested and verified on Intel iGPU</li>
      </ul>
    </div>
  </div>

  <!-- ─── ROADMAP ─── -->
  <div class="hud-divider"><div class="line"></div><div class="label">// DEVELOPMENT ROADMAP</div><div class="line"></div></div>

  <div class="section">
    <div class="section-title"><span class="icon">📌</span> Roadmap</div>
    <div class="roadmap-list">
      <div class="roadmap-item"><div class="roadmap-check">○</div>GTK Theme Pack</div>
      <div class="roadmap-item"><div class="roadmap-check">○</div>Nvidia Optimization Guide</div>
      <div class="roadmap-item"><div class="roadmap-check">○</div>Screenshot Utility</div>
      <div class="roadmap-item"><div class="roadmap-check">○</div>Auto Backup Script</div>
      <div class="roadmap-item"><div class="roadmap-check">○</div>One-click Restore</div>
    </div>
  </div>

  <!-- ─── AUTHOR ─── -->
  <div class="hud-divider"><div class="line"></div><div class="label">// AUTHOR</div><div class="line"></div></div>

  <div class="section">
    <div class="author-card">
      <div class="author-avatar">⬡</div>
      <div>
        <div class="author-name">Arunachalam</div>
        <div class="author-tags">
          <span class="author-tag">Arch Linux Power User</span>
          <span class="author-tag">Hyprland Customizer</span>
        </div>
        <a href="https://github.com/Arunachalam-gojosaturo" class="author-link" target="_blank">
          ⬡ github.com/Arunachalam-gojosaturo
        </a>
      </div>
    </div>
  </div>

  <!-- ─── STAR CTA ─── -->
  <div class="star-cta">
    <p>IF THIS SETUP POWERED UP YOUR DESKTOP</p>
    <div style="font-size:0.85rem; color: var(--text-dim); font-family:'Rajdhani',sans-serif; letter-spacing:0.05em;">
      Consider giving the repository a star on GitHub
    </div>
    <div class="star-text">⭐</div>
  </div>

  <div class="footer">
    MIT LICENSE &nbsp;·&nbsp; ARC-HYPERLAND &nbsp;·&nbsp; ARUNACHALAM &nbsp;·&nbsp; ARCH LINUX
  </div>

</div>
</body>
</html>
