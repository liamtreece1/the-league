@import "tailwindcss";
@import "tw-animate-css";

@custom-variant dark (&:is(.dark *));

:root {
  --radius: 0.625rem;

  /* Core palette — dark HUD */
  --background: oklch(0.12 0.02 250);
  --foreground: oklch(0.96 0.02 220);
  --card: oklch(0.16 0.03 250);
  --card-foreground: oklch(0.96 0.02 220);
  --popover: oklch(0.16 0.03 250);
  --popover-foreground: oklch(0.96 0.02 220);
  --primary: oklch(0.78 0.18 220);
  --primary-foreground: oklch(0.12 0.02 250);
  --secondary: oklch(0.22 0.04 250);
  --secondary-foreground: oklch(0.96 0.02 220);
  --muted: oklch(0.22 0.03 250);
  --muted-foreground: oklch(0.72 0.04 230);
  --accent: oklch(0.28 0.08 220);
  --accent-foreground: oklch(0.96 0.02 220);
  --destructive: oklch(0.65 0.22 25);
  --border: oklch(0.28 0.05 230 / 0.5);
  --input: oklch(0.22 0.04 250);
  --ring: oklch(0.78 0.18 220);

  /* System-specific semantic tokens */
  --system-cyan: oklch(0.82 0.18 220);
  --system-cyan-soft: oklch(0.82 0.18 220 / 0.15);
  --system-blue: oklch(0.70 0.22 260);
  --system-gold: oklch(0.85 0.17 90);
  --system-magenta: oklch(0.72 0.25 330);
}

.dark {
  --background: oklch(0.10 0.02 250);
  --foreground: oklch(0.96 0.02 220);
  --card: oklch(0.14 0.03 250);
  --card-foreground: oklch(0.96 0.02 220);
  --popover: oklch(0.14 0.03 250);
  --popover-foreground: oklch(0.96 0.02 220);
  --primary: oklch(0.82 0.18 220);
  --primary-foreground: oklch(0.10 0.02 250);
  --secondary: oklch(0.20 0.04 250);
  --secondary-foreground: oklch(0.96 0.02 220);
  --muted: oklch(0.20 0.03 250);
  --muted-foreground: oklch(0.72 0.04 230);
  --accent: oklch(0.28 0.08 220);
  --accent-foreground: oklch(0.96 0.02 220);
  --destructive: oklch(0.65 0.22 25);
  --border: oklch(0.30 0.05 230 / 0.5);
  --input: oklch(0.22 0.04 250);
  --ring: oklch(0.82 0.18 220);
}

@theme inline {
  --color-background: var(--background);
  --color-foreground: var(--foreground);
  --color-card: var(--card);
  --color-card-foreground: var(--card-foreground);
  --color-popover: var(--popover);
  --color-popover-foreground: var(--popover-foreground);
  --color-primary: var(--primary);
  --color-primary-foreground: var(--primary-foreground);
  --color-secondary: var(--secondary);
  --color-secondary-foreground: var(--secondary-foreground);
  --color-muted: var(--muted);
  --color-muted-foreground: var(--muted-foreground);
  --color-accent: var(--accent);
  --color-accent-foreground: var(--accent-foreground);
  --color-destructive: var(--destructive);
  --color-border: var(--border);
  --color-input: var(--input);
  --color-ring: var(--ring);
  --color-system-cyan: var(--system-cyan);
  --color-system-blue: var(--system-blue);
  --color-system-gold: var(--system-gold);
  --color-system-magenta: var(--system-magenta);
  --radius-sm: calc(var(--radius) - 4px);
  --radius-md: calc(var(--radius) - 2px);
  --radius-lg: var(--radius);
  --radius-xl: calc(var(--radius) + 4px);
}

@layer base {
  * {
    @apply border-border;
  }

  html,
  body {
    @apply bg-background text-foreground antialiased;
    font-family: ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
  }

  body {
    background-color: var(--background);
    background-image:
      radial-gradient(ellipse 80% 60% at 50% -10%, oklch(0.30 0.15 230 / 0.35), transparent 70%),
      radial-gradient(ellipse 60% 50% at 90% 100%, oklch(0.25 0.18 280 / 0.25), transparent 70%),
      radial-gradient(ellipse 50% 40% at 10% 110%, oklch(0.28 0.15 210 / 0.20), transparent 70%);
    background-attachment: fixed;
    min-height: 100vh;
  }

  /* Faint scanline overlay for full "System" vibe */
  body::before {
    content: "";
    position: fixed;
    inset: 0;
    pointer-events: none;
    background-image: repeating-linear-gradient(
      to bottom,
      transparent 0,
      transparent 2px,
      oklch(0.82 0.18 220 / 0.02) 2px,
      oklch(0.82 0.18 220 / 0.02) 3px
    );
    z-index: 1;
    mix-blend-mode: overlay;
  }

  /* Glowing scrollbar */
  ::-webkit-scrollbar {
    width: 10px;
    height: 10px;
  }
  ::-webkit-scrollbar-track {
    background: oklch(0.14 0.03 250);
  }
  ::-webkit-scrollbar-thumb {
    background: oklch(0.40 0.12 230 / 0.6);
    border-radius: 8px;
    box-shadow: 0 0 8px oklch(0.82 0.18 220 / 0.4);
  }
  ::-webkit-scrollbar-thumb:hover {
    background: oklch(0.60 0.18 220 / 0.8);
  }
}

@layer utilities {
  /* System-themed glow utilities */
  .glow-cyan {
    box-shadow:
      0 0 0 1px oklch(0.82 0.18 220 / 0.5),
      0 0 20px oklch(0.82 0.18 220 / 0.35),
      0 0 40px oklch(0.82 0.18 220 / 0.15);
  }

  .glow-cyan-soft {
    box-shadow:
      0 0 0 1px oklch(0.82 0.18 220 / 0.3),
      0 0 15px oklch(0.82 0.18 220 / 0.2);
  }

  .glow-gold {
    box-shadow:
      0 0 0 1px oklch(0.85 0.17 90 / 0.6),
      0 0 25px oklch(0.85 0.17 90 / 0.45),
      0 0 60px oklch(0.85 0.17 90 / 0.25);
  }

  .glow-magenta {
    box-shadow:
      0 0 0 1px oklch(0.72 0.25 330 / 0.55),
      0 0 20px oklch(0.72 0.25 330 / 0.4);
  }

  .text-glow-cyan {
    text-shadow:
      0 0 8px oklch(0.82 0.18 220 / 0.8),
      0 0 20px oklch(0.82 0.18 220 / 0.5);
  }

  .text-glow-gold {
    text-shadow:
      0 0 10px oklch(0.85 0.17 90 / 0.9),
      0 0 25px oklch(0.85 0.17 90 / 0.6);
  }

  .border-glow-cyan {
    border: 1px solid oklch(0.82 0.18 220 / 0.5);
    box-shadow:
      inset 0 0 12px oklch(0.82 0.18 220 / 0.1),
      0 0 12px oklch(0.82 0.18 220 / 0.25);
  }

  .hud-panel {
    background:
      linear-gradient(135deg, oklch(0.16 0.04 250 / 0.85), oklch(0.12 0.03 260 / 0.85)),
      linear-gradient(
        to bottom right,
        oklch(0.82 0.18 220 / 0.06),
        transparent 40%
      );
    backdrop-filter: blur(12px);
    border: 1px solid oklch(0.82 0.18 220 / 0.25);
  }

  .xp-bar-fill {
    background: linear-gradient(
      90deg,
      oklch(0.70 0.22 260),
      oklch(0.82 0.18 220),
      oklch(0.90 0.16 200)
    );
    background-size: 200% 100%;
    animation: xp-shimmer 3s linear infinite;
    box-shadow:
      0 0 8px oklch(0.82 0.18 220 / 0.8),
      0 0 20px oklch(0.82 0.18 220 / 0.4);
  }

  @keyframes xp-shimmer {
    0% {
      background-position: 0% 50%;
    }
    100% {
      background-position: 200% 50%;
    }
  }

  @keyframes pulse-glow {
    0%, 100% {
      opacity: 1;
      box-shadow:
        0 0 0 1px oklch(0.82 0.18 220 / 0.5),
        0 0 20px oklch(0.82 0.18 220 / 0.4);
    }
    50% {
      opacity: 0.92;
      box-shadow:
        0 0 0 1px oklch(0.82 0.18 220 / 0.8),
        0 0 40px oklch(0.82 0.18 220 / 0.7);
    }
  }

  .animate-pulse-glow {
    animation: pulse-glow 2.4s ease-in-out infinite;
  }

  @keyframes float-in {
    0% {
      transform: translateY(-12px) scale(0.96);
      opacity: 0;
    }
    100% {
      transform: translateY(0) scale(1);
      opacity: 1;
    }
  }

  .animate-float-in {
    animation: float-in 0.5s cubic-bezier(0.16, 1, 0.3, 1) both;
  }

  @keyframes float-y {
    0%, 100% {
      transform: translateY(0);
    }
    50% {
      transform: translateY(-4px);
    }
  }

  .animate-float-y {
    animation: float-y 3s ease-in-out infinite;
  }

  @keyframes level-up-burst {
    0% {
      transform: scale(0.6) rotate(-4deg);
      opacity: 0;
      filter: blur(10px);
    }
    40% {
      transform: scale(1.1) rotate(2deg);
      opacity: 1;
      filter: blur(0);
    }
    100% {
      transform: scale(1) rotate(0);
      opacity: 1;
    }
  }

  .animate-level-up-burst {
    animation: level-up-burst 0.9s cubic-bezier(0.2, 0.9, 0.3, 1.2) both;
  }

  @keyframes spark {
    0% {
      transform: translate(0, 0) scale(0.5);
      opacity: 1;
    }
    100% {
      transform: translate(var(--dx, 40px), var(--dy, -40px)) scale(0);
      opacity: 0;
    }
  }

  .animate-spark {
    animation: spark 1.2s ease-out forwards;
  }
}
