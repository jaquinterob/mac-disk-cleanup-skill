# mac-disk-cleanup-skill

Cursor Agent Skill to free disk space on macOS — safely.

Skill de Cursor para liberar espacio en disco en macOS — con cuidado.

---

## English

### What it does (mode B)

1. **Audits** free space and common caches (Xcode, Docker, Homebrew, npm).
2. **Auto-cleans Safe tier** — regenerable caches only.
3. **Asks before Risky tier** — simulators, Docker volumes, Archives, etc.
4. **Never** touches Documents, Photos, SSH keys, or source projects unless you name a path.

### Install (Cursor)

```bash
git clone https://github.com/jaquinterob/mac-disk-cleanup-skill.git
mkdir -p ~/.cursor/skills
ln -sfn "$(pwd)/mac-disk-cleanup-skill/skills/mac-disk-cleanup" ~/.cursor/skills/mac-disk-cleanup
```

Or copy the folder:

```bash
cp -R mac-disk-cleanup-skill/skills/mac-disk-cleanup ~/.cursor/skills/mac-disk-cleanup
```

Restart Cursor or start a new agent chat, then ask e.g. *“Free up disk space on my Mac”*.

### Manual scripts

```bash
cd skills/mac-disk-cleanup
bash scripts/audit.sh        # report sizes
bash scripts/clean-safe.sh   # Safe tier only
```

### Safe vs Risky

| Safe (no prompt in mode B) | Risky (needs your OK) |
|----------------------------|------------------------|
| Xcode DerivedData | Simulator runtimes |
| `brew cleanup` + brew cache | `docker system prune --volumes` |
| `npm cache clean --force` | Xcode Archives / DeviceSupport |
| `docker system prune -f` | Deleting extra Xcode.app |

---

## Español

### Qué hace (modo B)

1. **Audita** espacio libre y cachés habituales (Xcode, Docker, Homebrew, npm).
2. **Limpia solo el nivel Safe** — cachés regenerables.
3. **Pide confirmación** antes del nivel Risky — simuladores, volúmenes Docker, Archives, etc.
4. **Nunca** toca Documentos, Fotos, llaves SSH ni código de proyectos salvo que indiques una ruta.

### Instalar (Cursor)

```bash
git clone https://github.com/jaquinterob/mac-disk-cleanup-skill.git
mkdir -p ~/.cursor/skills
ln -sfn "$(pwd)/mac-disk-cleanup-skill/skills/mac-disk-cleanup" ~/.cursor/skills/mac-disk-cleanup
```

O copia la carpeta a `~/.cursor/skills/mac-disk-cleanup`.

Reinicia Cursor o abre un chat nuevo y pide, por ejemplo: *“Libera espacio en mi Mac”*.

### Scripts

```bash
cd skills/mac-disk-cleanup
bash scripts/audit.sh
bash scripts/clean-safe.sh
```

---

## Layout

```
skills/mac-disk-cleanup/
├── SKILL.md           # Agent instructions
├── reference.md       # Full command catalog
└── scripts/
    ├── audit.sh
    └── clean-safe.sh
```

## License

MIT — see [LICENSE](LICENSE).
