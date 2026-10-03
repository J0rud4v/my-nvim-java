# 🚀 Neovim Configuration (v0.11+)

Configuración moderna, modular y ultrarrápida para **Neovim 0.11+**, estructurada con [`lazy.nvim`](https://github.com/folke/lazy.nvim) y aprovechando la API nativa de LSP (`vim.lsp.config` / `vim.lsp.enable`).

Especialmente optimizada para desarrollo en **Java** (con `nvim-jdtls` y DAP), **Kotlin**, **Angular**, **TypeScript/JavaScript**, **Python**, **C/C++** y scripting en **Bash/Lua**.

---

## 📑 Tabla de Contenidos

- [✨ Características Principales](#-características-principales)
- [📁 Estructura del Proyecto](#-estructura-del-proyecto)
- [🛠️ Lenguajes y LSPs Soportados](#️-lenguajes-y-lsps-soportados)
- [📦 Plugins Incluidos](#-plugins-incluidos)
- [⚙️ Requisitos Previos](#️-requisitos-previos)
- [🚀 Instalación y Puesta en Marcha](#-instalación-y-puesta-en-marcha)
- [⌨️ Atajos de Teclado (Keymaps)](#️-atajos-de-teclado-keymaps)
- [🐛 Solución de Problemas](#-solución-de-problemas)

---

## ✨ Características Principales

- **Arquitectura Modular**: Separación clara entre opciones base (`lua/base/`), módulos de plugins (`lua/plugins/`) y configuración de LSPs (`lua/lsps/`).
- **Neovim 0.11 Ready**: Configuración moderna de servidores mediante `vim.lsp.config` y `vim.lsp.enable`.
- **Desarrollo en Java**: Soporte completo con `nvim-jdtls`, depuración integrada, integración con proyectos Maven / Gradle y soporte para proyectos individuales.
- **Depuración Visual (DAP)**: `nvim-dap` integrado con `nvim-dap-ui` y `nvim-dap-virtual-text` con adaptadores para Java, Python (`debugpy`) y Bash (`bashdb`).
- **Autocompletado Rápido**: Motor `nvim-cmp` con fuentes para LSP, snippets y firmas dinámicas.
- **Búsqueda Difusa**: `telescope.nvim` con previsualizador de archivos, buffers, grep y tags.
- **Git Integrado**: Marcadores de estado en línea con `gitsigns.nvim` y comandos avanzados con `vim-fugitive`.
- **Estética & Temas**: Gruvbox (por defecto), Tokyo Night y Night Owl, con soporte transparente, `lualine` y `bufferline`.

---

## 📁 Estructura del Proyecto

```text
~/.config/nvim/
├── init.lua                   # Punto de entrada principal
├── lazy-lock.json             # Bloqueo de versiones de plugins
└── lua/
    ├── base/                  # Configuración base de Neovim
    │   ├── options.lua        # Opciones globales (tabs, números de línea, etc.)
    │   ├── keymaps.lua        # Mapeos globales (buffers, explorer, diagnósticos)
    │   ├── autocmds.lua       # Autocomandos automáticos
    │   └── lazy.lua           # Bootstrap y setup de lazy.nvim
    │
    ├── lsps/                  # Configuración del ecosistema LSP
    │   ├── init.lua           # Capacidades, on_attach común y keymaps de LSP
    │   └── servers/           # Configuración individual de servidores
    │       ├── defaults.lua   # Servidores estándar (pyright, ts_ls, clangd, etc.)
    │       ├── lua.lua        # lua_ls con runtime y workspaces configurados
    │       ├── angular.lua    # angularls (Language Service)
    │       ├── kotlin.lua     # kotlin_language_server
    │       └── jdtls.lua      # Configuración avanzada para Java
    │
    └── plugins/               # Especificaciones modulares para lazy.nvim
        ├── completion/        # nvim-cmp, luasnip, fuentes de autocompletado
        ├── dap/               # nvim-dap, nvim-dap-ui, nvim-dap-virtual-text
        ├── editor/            # telescope, nvim-tree, treesitter, autopairs, glow
        ├── git/               # vim-fugitive, gitsigns
        ├── lsp/               # mason.nvim, nvim-lspconfig
        └── ui/                # bufferline, lualine, temas (gruvbox, tokyonight, nightowl)
```

---

## 🛠️ Lenguajes y LSPs Soportados

Gestionados automáticamente mediante **Mason**:

| Lenguaje / Entorno | Servidor LSP / Adaptador | Herramientas Adicionales |
|--------------------|--------------------------|--------------------------|
| **Java** | `jdtls` | `java-debug-adapter`, `java-test` |
| **Kotlin** | `kotlin-language-server` | JVM target 21 |
| **Lua** | `lua-language-server` | `stylua` (formateador) |
| **TypeScript / JS** | `typescript-language-server` (`ts_ls`) | Node.js |
| **Angular** | `angular-language-server` (`angularls`) | Soporte para plantillas y componentes |
| **Python** | `pyright` | `debugpy` (depuración) |
| **C / C++** | `clangd` | |
| **HTML / CSS / Sass**| `html-lsp`, `some-sass-language-server` | |
| **Bash / Shell** | `bash-language-server` | `bash-debug-adapter` |
| **XML** | `lemminx` | |

---

## 📦 Plugins Incluidos

### 🧩 Productividad & Editor
- [`folke/lazy.nvim`](https://github.com/folke/lazy.nvim): Gestor de plugins declarativo y ultrarrápido.
- [`nvim-tree/nvim-tree.lua`](https://github.com/nvim-tree/nvim-tree.lua): Explorador de archivos en árbol con iconos e indicadores de diagnóstico.
- [`nvim-telescope/telescope.nvim`](https://github.com/nvim-telescope/telescope.nvim): Búsqueda difusa de archivos, grep y buffers.
- [`nvim-treesitter/nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter): Resaltado de sintaxis preciso y plegado por AST.
- [`windwp/nvim-autopairs`](https://github.com/windwp/nvim-autopairs): Cierre automático de paréntesis y comillas.
- [`ellisonleao/glow.nvim`](https://github.com/ellisonleao/glow.nvim): Previsualizador de archivos Markdown integrado.

### 🧠 LSP & Autocompletado
- [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig): Configuraciones rápidas para el cliente LSP nativo.
- [`mason-org/mason.nvim`](https://github.com/mason-org/mason.nvim): Gestor de paquetes de LSPs, DAPs y linters.
- [`hrsh7th/nvim-cmp`](https://github.com/hrsh7th/nvim-cmp): Motor de autocompletado extensible.
- [`mfussenegger/nvim-jdtls`](https://github.com/mfussenegger/nvim-jdtls): Extensiones específicas para Java.

### 🐞 Depuración (DAP)
- [`mfussenegger/nvim-dap`](https://github.com/mfussenegger/nvim-dap): Cliente Debug Adapter Protocol para Neovim.
- [`rcarriga/nvim-dap-ui`](https://github.com/rcarriga/nvim-dap-ui): Interfaz gráfica con paneles de variables, pilas y consola.
- [`theHamsta/nvim-dap-virtual-text`](https://github.com/theHamsta/nvim-dap-virtual-text): Valores de variables en línea durante la depuración.

### 🎨 UI & Estética
- [`ellisonleao/gruvbox.nvim`](https://github.com/ellisonleao/gruvbox.nvim): Tema retro personalizable (activo por defecto).
- [`folke/tokyonight.nvim`](https://github.com/folke/tokyonight.nvim) & [`oxfist/night-owl.nvim`](https://github.com/oxfist/night-owl.nvim): Temas oscuros alternativos.
- [`nvim-lualine/lualine.nvim`](https://github.com/nvim-lualine/lualine.nvim): Barra de estado rápida e informativa.
- [`akinsho/bufferline.nvim`](https://github.com/akinsho/bufferline.nvim): Pestañas visuales superiores para buffers abiertos.

---

## ⚙️ Requisitos Previos

Asegúrate de contar con las siguientes dependencias instaladas en tu sistema:

- **Neovim >= 0.11.0**
- **Git**
- **JDK 21+** (imprescindible para `jdtls` y desarrollo Java moderno)
- **Node.js & npm** (requerido para LSPs basados en JS como `ts_ls`, `angularls`, `bashls`)
- **Python 3 con venv** (para `pyright` y depurador `debugpy`)
- **Compilador C** (`gcc` o `clang`) y `make` (para compilar extensiones como `fzf-native`)
- **Ripgrep & fd** (recomendados para máxima velocidad con Telescope):
  ```bash
  # En distribuciones basadas en Debian/Ubuntu:
  sudo apt install ripgrep fd-find
  ```

---

## 🚀 Instalación y Puesta en Marcha

1. **Clonar la configuración**:
   ```bash
   git clone https://github.com/tuusuario/nvim ~/.config/nvim
   ```

2. **Iniciar Neovim**:
   ```bash
   nvim
   ```
   `lazy.nvim` se descargará automáticamente e instalará todos los plugins declarados.

3. **Instalar los servidores LSP y herramientas**:
   Ejecuta dentro de Neovim el comando personalizado:
   ```vim
   :MasonInstallAll
   ```
   Esto instalará de forma concurrente todos los LSPs, adaptadores de debug y linters configurados en `ensure_installed`.

4. **Verificar el estado del entorno**:
   ```vim
   :checkhealth
   ```

---

## ⌨️ Atajos de Teclado (Keymaps)

> **Nota:** La tecla líder (`<leader>`) está configurada como la barra espaciadora (`Space`).

### 📂 Explorador y Navegación de Buffers

| Modo | Atajo | Descripción |
|:---:|:---|:---|
| Normal | `<leader>e` | Abrir / enfocar / alternar `nvim-tree` |
| Normal | `<Tab>` | Ir al buffer siguiente |
| Normal | `<S-Tab>` | Ir al buffer anterior |
| Normal | `<leader>1` | Ir al primer buffer |
| Normal | `<leader>0` | Ir al último buffer |
| Normal | `<space><CR>` | Alternar pliegue de código (*fold*) |

### 🔍 Búsqueda con Telescope

| Modo | Atajo | Descripción |
|:---:|:---|:---|
| Normal | `<leader>ff` | Buscar archivos por nombre |
| Normal | `<leader>fg` | Búsqueda de texto en el proyecto (*live grep*) |
| Normal | `<leader>fb` | Listar buffers abiertos |
| Normal | `<leader>fh` | Buscar en la ayuda de Neovim |

### 🧠 LSP & Navegación de Código

| Modo | Atajo | Descripción |
|:---:|:---|:---|
| Normal | `gd` | Ir a la definición |
| Normal | `gD` | Ir a la declaración |
| Normal | `gi` | Ir a la implementación |
| Normal | `<leader>D` | Ir a la definición de tipo |
| Normal | `K` | Mostrar documentación flotante (*hover*) |
| Normal | `<C-k>` | Mostrar ayuda de firma (*signature help*) |
| Normal | `<leader>rn` | Renombrar símbolo |
| Normal / Visual | `<leader>ca` | Menú de acciones de código (*code actions*) |
| Normal | `<leader>f` | Formatear documento |
| Normal | `<leader>d` | Mostrar mensaje de diagnóstico flotante |
| Normal | `[d` / `]d` | Diagnóstico anterior / siguiente |
| Normal | `<leader>q` | Enviar diagnósticos a la lista de ubicaciones (*loclist*) |

### 🐞 Depuración (DAP)

| Modo | Atajo | Descripción |
|:---:|:---|:---|
| Normal | `<F5>` | Iniciar / Continuar ejecución |
| Normal | `<leader><F5>` | Repetir última sesión de depuración |
| Normal | `<leader><F6>` | Finalizar sesión de depuración |
| Normal | `<F10>` | Paso por encima (*Step Over*) |
| Normal | `<F11>` | Paso adentro (*Step Into*) |
| Normal | `<F12>` | Paso afuera (*Step Out*) |
| Normal | `<leader>b` | Alternar punto de interrupción (*breakpoint*) |
| Normal | `<leader>B` | Punto de interrupción condicional |
| Normal | `<leader>od` | Abrir interfaz gráfica (`dap-ui`) |
| Normal | `<leader>cd` | Cerrar interfaz gráfica (`dap-ui`) |
| Normal | `<leader>oc` | Abrir consola y REPL de depuración |

### 🐙 Git (Gitsigns & Fugitive)

| Modo | Atajo | Descripción |
|:---:|:---|:---|
| Normal | `<leader>hp` | Previsualizar cambio en el bloque actual (*preview hunk*) |
| Normal | `<leader>hs` | Preparar bloque actual (*stage hunk*) |
| Normal | `[c` / `]c` | Ir al cambio anterior / siguiente |
| Comando | `:Git` | Abrir panel de control de Git (`vim-fugitive`) |

---

## 🐛 Solución de Problemas

- **Error con JDTLS / Java Language Server**:
  Asegúrate de tener Java 21+ instalado por defecto:
  ```bash
  java -version
  ```
- **Error "module not found" tras añadir un plugin**:
  Recarga o sincroniza lazy con:
  ```vim
  :Lazy sync
  ```
- **LSP no adjunta a los archivos**:
  Verifica si el servidor correspondiente está activo y reconociendo el root directory con:
  ```vim
  :checkhealth lsp
  ```
- **Telescope no realiza búsquedas de texto**:
  Asegúrate de tener `ripgrep` (`rg`) instalado en tu sistema operativo.

---

## 📄 Licencia

Distribuido bajo la licencia [MIT](LICENSE). Siéntete libre de clonarlo, modificarlo y adaptarlo a tu propio flujo de trabajo.