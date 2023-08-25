// vim: set ft=javascript tabstop=4 shiftwidth=4 expandtab:
const {
    aceVimMap,
    mapkey,
    imap,
    iunmap,
    imapkey,
    getClickableElements,
    vmapkey,
    map,
    unmap,
    cmap,
    addSearchAlias,
    removeSearchAlias,
    tabOpenLink,
    readText,
    Clipboard,
    Front,
    Hints,
    Visual,
    RUNTIME,
} = api;

// Global

// settings.hintAlign = "left";
//Events.hotKey="<Meta-s>";

unmap('u');
unmap('<Ctrl-i>');
map('<Ctrl-i>', '<Alt-s>');  // FIXME it not works https://github.com/brookhong/Surfingkeys/issues/290

// Insert mode

iunmap('<Ctrl-f>');
iunmap('<Ctrl-e>');

// Navigator

map('h', 'E');  // tab focus left
map('l', 'R');  // tab focus right
map('<Ctrl-d>', 'd');  // 下翻半页
map('u', 'e');  // 上翻半页
map('<Ctrl-u>', 'e');  // 上翻半页
map('H', 'S');  // backward
map('L', 'D');  // forward
map('T', 'on'); // 新标签页

settings.smartPageBoundary = false; // 智能页面边界
iunmap(":"); // disable emoji input

// Action

map('F', 'af'); // open in new tab
// map('F', 'gf'); // open in new unactive tab
mapkey('p', "Open the clipboard's URL in the current tab", function() {
    navigator.clipboard.readText().then(
        text => {
            if (text.startsWith("http://") || text.startsWith("https://")) {
                window.location = text;
            } else {
                window.location = text = "https://www.bing.com/search?q=" + text;
            }
        }
    );
});
mapkey('P', 'Open link from clipboard', function() {
    navigator.clipboard.readText().then(
        text => {
            if (text.startsWith("http://") || text.startsWith("https://")) {
                tabOpenLink(text);
            } else {
                tabOpenLink("https://www.bing.com/search?q=" + text);
            }
        }
    );
});

// source: https://gist.github.com/Echostream/fe560aa30271172398cf432b7b281fd5
mapkey('gi', '#1Go to edit box', function() {
    var inputs = document.getElementsByTagName('input');
    var input = null;
    for(var i=0; i<inputs.length; i++) {
        if(inputs[i].type=='text') {
            input = inputs[i];
            break;
        }
    }
    if(input) {
        input.click();
        input.focus();
    }
});

// Search Engine
// addSearchAlias('zh', 'zhihu', 'https://www.zhihu.com/search?q=');
// addSearchAlias('t', 'twitter', 'https://twitter.com/search/');
// addSearchAlias('we', 'wikipedia-en', 'http://en.wikipedia.org/wiki/Special:Search?search=');
// addSearchAlias('wc', 'wikipedia-cn', 'https://zh.wikipedia.org/w/index.php?title=Special:%E6%90%9C%E7%B4%A2&search=');
// addSearchAlias('tb', 'taobao', 'https://s.taobao.com/search?q=');
// addSearchAlias('h', 'hici', 'http://dict.cn/search.php?q=');
// addSearchAlias('k', 'kindle', 'http://www.amazon.cn/s/ref=nb_sb_noss?field-keywords=');
// addSearchAlias('bing', 'bing', 'http://www.bing.com/search?q=');
// addSearchAlias('etao', 'etao', 'http://s.etao.com/search?q=');
// addSearchAlias('db', 'douban', 'http://www.douban.com/search?q=');
// addSearchAlias('ip', 'ip', 'https://www.ipshudi.com/');
// addSearchAlias('wb', 'weibo', 'http://s.weibo.com/weibo/');
// addSearchAlias('jd', 'jd', 'http://search.jd.com/Search?keyword=');
// addSearchAlias('dk', 'duckduckgo', 'https://duckduckgo.com/?q=');
addSearchAlias('h', 'github', 'https://github.com/search?ref=opensearch&q=');

// Style
// 参考：https://github.com/Foldex/surfingkeys-config
// 主题：Doom One

Hints.style('border: solid 2px #282C34; color:#98be65; background: initial; background-color: #2E3440;');
Hints.style("border: solid 2px #282C34 !important; padding: 1px !important; color: #51AFEF !important; background: #2E3440 !important;", "text");
Visual.style('marks', 'background-color: #98be6599;');
Visual.style('cursor', 'background-color: #51AFEF;');

settings.theme = `

:root {
  /* Font */
  --font: 'Source Code Pro', Ubuntu, sans;
  --font-size: 18px;
  --font-weight: normal;
  
  --fg: #51AFEF;
  --bg: #2E3440;
  --bg-dark: #21242B;
  --border: #2257A0;
  --main-fg: #51AFEF;
  --accent-fg: #98be65;
  --info-fg: #C678DD;
  --select: #4C566A;
}

/* ---------- Generic ---------- */
.sk_theme {
background: var(--bg);
color: var(--fg);
  background-color: var(--bg);
  border-color: var(--border);
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
}

input {
  font-family: var(--font);
  font-weight: var(--font-weight);
}

.sk_theme tbody {
  color: var(--fg);
}

.sk_theme input {
  color: var(--fg);
}

/* Hints */
#sk_hints .begin {
  color: var(--accent-fg) !important;
}

#sk_tabs .sk_tab {
  background: var(--bg-dark);
  border: 1px solid var(--border);
}

#sk_tabs .sk_tab_title {
  color: var(--fg);
}

#sk_tabs .sk_tab_url {
  color: var(--main-fg);
}

#sk_tabs .sk_tab_hint {
  background: var(--bg);
  border: 1px solid var(--border);
  color: var(--accent-fg);
}

.sk_theme #sk_frame {
  background: var(--bg);
  opacity: 0.2;
  color: var(--accent-fg);
}

.sk_theme .title {
  color: var(--accent-fg);
}

.sk_theme .url {
  color: var(--main-fg);
}

.sk_theme .annotation {
  color: var(--accent-fg);
}

.sk_theme .omnibar_highlight {
  color: var(--accent-fg);
}

.sk_theme .omnibar_timestamp {
  color: var(--info-fg);
}

.sk_theme .omnibar_visitcount {
  color: var(--accent-fg);
}

.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
  background: var(--bg-dark);
}

.sk_theme #sk_omnibarSearchResult ul li.focused {
  background: var(--border);
}

.sk_theme #sk_omnibarSearchArea {
  border-top-color: var(--border);
  border-bottom-color: var(--border);
}

.sk_theme #sk_omnibarSearchArea input,
.sk_theme #sk_omnibarSearchArea span {
  font-size: var(--font-size);
}

.sk_theme .separator {
  color: var(--accent-fg);
}

/* ---------- Popup Notification Banner ---------- */
#sk_banner {
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
  background: var(--bg);
  border-color: var(--border);
  color: var(--fg);
  opacity: 0.9;
}

/* ---------- Popup Keys ---------- */
#sk_keystroke {
  background-color: var(--bg);
}

.sk_theme kbd .candidates {
  color: var(--info-fg);
}

.sk_theme span.annotation {
  color: var(--accent-fg);
}

/* ---------- Popup Translation Bubble ---------- */
#sk_bubble {
  background-color: var(--bg) !important;
  color: var(--fg) !important;
  border-color: var(--border) !important;
}

#sk_bubble * {
  color: var(--fg) !important;
}

#sk_bubble div.sk_arrow div:nth-of-type(1) {
  border-top-color: var(--border) !important;
  border-bottom-color: var(--border) !important;
}

#sk_bubble div.sk_arrow div:nth-of-type(2) {
  border-top-color: var(--bg) !important;
  border-bottom-color: var(--bg) !important;
}

/* ---------- Search ---------- */
#sk_status,
#sk_find {
  font-size: var(--font-size);
  border-color: var(--border);
}

.sk_theme kbd {
  background: var(--bg-dark);
  border-color: var(--border);
  box-shadow: none;
  color: var(--fg);
}

.sk_theme .feature_name span {
  color: var(--main-fg);
}

/* ---------- ACE Editor ---------- */
#sk_editor {
  background: var(--bg-dark) !important;
  height: 50% !important;
  /* Remove this to restore the default editor size */
}

.ace_dialog-bottom {
  border-top: 1px solid var(--bg) !important;
}

.ace-chrome .ace_print-margin,
.ace_gutter,
.ace_gutter-cell,
.ace_dialog {
  background: var(--bg) !important;
}

.ace-chrome {
  color: var(--fg) !important;
}

.ace_gutter,
.ace_dialog {
  color: var(--fg) !important;
}

.ace_cursor {
  color: var(--fg) !important;
}

.normal-mode .ace_cursor {
  background-color: var(--fg) !important;
  border: var(--fg) !important;
  opacity: 0.7 !important;
}

.ace_marker-layer .ace_selection {
  background: var(--select) !important;
}

.ace_editor,
.ace_dialog span,
.ace_dialog input {
  font-family: var(--font);
  font-size: var(--font-size);
  font-weight: var(--font-weight);
}

/* 自定义 */
#sk_omnibar {
    overflow: hidden;
    position: fixed;
    width: 68%;
    max-height: 68%;
    left: 16%;
    text-align: left;
    box-shadow: 0px 2px 18px rgba(0, 0, 0, 0.8);
    z-index: 2147483000;
    border: 1px solid #5d5d5d;
}
.sk_theme #sk_omnibarSearchArea {
  border: none;
}
.sk_omnibar_middle {
    border-radius: 8px;
}
#sk_omnibarSearchResult>ul>li {
    padding: 5px 8px 2px 8px;
}
#sk_omnibarSearchResult li div.url {
    font-weight: var(--font-weight);
    color: #9d9d9d;
}
.sk_theme .omnibar_folder {
    color: #a8a1e0;
}
`;