---
title: 2023-06-10
date: 2023-06-10T12:48:01+08:00
lastmod: 2023-06-10T15:11:24+08:00
draft: true
comments: true
math: true
---

## 同步或异步加载 Javascript 脚本

```javascript
function loadScript(src, type = "text/javascript",async = true) {
    var scriptEle = document.createElement('script');
    scriptEle.src = src;
    scriptEle.type = type;
    scriptEle.async = async;
    scriptEle.defer = true;

    return new Promise((resolve, reject) => {
        scriptEle.onload = e => resolve(e);
        scriptEle.onerror = e => reject(e);
        document.head.appendChild(scriptEle);
    });

}


// example
loadScript('https://cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js')
    .then(() => {
        mermaid.initialize({
            startOnLoad: true,
            theme: 'neutral',
            pie: {
                useMaxWidth: false
            }
        });
    })
    .catch(e => {
        console.error("failed to load mermaid.min.js:", e)
    })
```

## MathJax 公式自动编号

MathJax 自带自动编号公式的功能，可通过这样配置开启：

```javascript
window.MathJax = {
    tex: {
        tags: 'ams'
    }
}
```

这样配置之后，在等式（equation）环境中的内容将会被自动编号。

    $$\begin{equation}
       E = mc^2
    \end{equation}
    $$

    $$\begin{equation}
       E = mc^2
    \end{equation}
    $$

    $$\begin{equation}
       E = mc^2
    \end{equation}
    $$

$$\begin{equation}
   E = mc^2
\end{equation}
$$

$$\begin{equation}
   E = mc^2
\end{equation}
$$

$$\begin{equation}
   E = mc^2
\end{equation}
$$


