# mac-disk-cleanup-skill

**Portable Agent Skill** (`SKILL.md` open standard) to free disk space on macOS — safely.

Skill portable para liberar espacio en disco en macOS. Funciona con **Claude Code, OpenAI Codex, Cursor, Gemini CLI, OpenCode** y cualquier agente que cargue skills desde una carpeta con `SKILL.md`.

No está atado a un único producto: el formato es el estándar abierto de Agent Skills.

---

## English

### What it does (mode B)

1. **Audits** free space and common caches (Xcode, Docker, Homebrew, npm).
2. **Auto-cleans Safe tier** — regenerable caches only.
3. **Asks before Risky tier** — simulators, Docker volumes, Archives, etc.
4. **Never** touches Documents, Photos, SSH keys, or source projects unless you name a path.

### Quick install (all major agents)

```bash
git clone https://github.com/jaquinterob/mac-disk-cleanup-skill.git
cd mac-disk-cleanup-skill
./install.sh
```

`install.sh` symlinks the skill into the usual personal skill dirs:

| Agent | Personal path |
|-------|----------------|
| Codex / shared | `~/.agents/skills/mac-disk-cleanup` |
| Claude Code | `~/.claude/skills/mac-disk-cleanup` |
| Cursor | `~/.cursor/skills/mac-disk-cleanup` |
| Codex (legacy dir) | `~/.codex/skills/mac-disk-cleanup` |

Then ask your agent: *“Free up disk space on my Mac”*.

### Manual install (pick one)

Canonical folder to link or copy:

`skills/mac-disk-cleanup/`  → contains `SKILL.md`, `reference.md`, `scripts/`

```bash
SKILL_SRC="$(pwd)/skills/mac-disk-cleanup"

# Codex / many agents (recommended shared location)
mkdir -p ~/.agents/skills && ln -sfn "$SKILL_SRC" ~/.agents/skills/mac-disk-cleanup

# Claude Code
mkdir -p ~/.claude/skills && ln -sfn "$SKILL_SRC" ~/.claude/skills/mac-disk-cleanup

# Cursor
mkdir -p ~/.cursor/skills && ln -sfn "$SKILL_SRC" ~/.cursor/skills/mac-disk-cleanup
```

**Project-scoped:** put (or symlink) the same folder at:

- `.agents/skills/mac-disk-cleanup/` — Codex, Cursor, Gemini CLI, OpenCode, …
- `.claude/skills/mac-disk-cleanup/` — Claude Code (does not scan `.agents/` alone)

### Works without any agent

```bash
cd skills/mac-disk-cleanup
bash scripts/audit.sh
bash scripts/clean-safe.sh   # Safe tier only
```

### Safe vs Risky

| Safe (no prompt in mode B) | Risky (needs your OK) |
|----------------------------|------------------------|
| Xcode DerivedData | Simulator runtimes |
| `brew cleanup` + brew cache | `docker system prune --volumes` |
| `npm cache clean --force` | Xcode Archives / DeviceSupport |
| `docker system prune -f` | Deleting extra Xcode.app |

### Other agents / custom setups

Point the agent at `skills/mac-disk-cleanup/SKILL.md` (or paste its contents into your system prompt / custom instructions). Scripts stay next to the skill; run them with a shell from that directory.

---

## Español

### Qué hace (modo B)

1. **Audita** espacio libre y cachés (Xcode, Docker, Homebrew, npm).
2. **Limpia solo Safe** — cachés regenerables.
3. **Pide confirmación** en Risky — simuladores, volúmenes Docker, Archives, etc.
4. **Nunca** toca Documentos, Fotos, SSH ni código salvo que indiques una ruta.

### Instalación rápida

```bash
git clone https://github.com/jaquinterob/mac-disk-cleanup-skill.git
cd mac-disk-cleanup-skill
./install.sh
```

Luego pídele a tu agente: *“Libera espacio en mi Mac”*.

Compatible con Claude Code, Codex, Cursor y otros que lean Agent Skills. Detalle de rutas en la tabla de arriba (sección English).

### Sin agente

```bash
cd skills/mac-disk-cleanup
bash scripts/audit.sh
bash scripts/clean-safe.sh
```

---

## Layout

```
skills/mac-disk-cleanup/     # portable skill package (share this folder)
├── SKILL.md                 # Agent Skills standard
├── reference.md
└── scripts/
    ├── audit.sh
    └── clean-safe.sh
install.sh                   # symlink into Claude / Codex / Cursor dirs
```

## License

MIT — see [LICENSE](LICENSE).
