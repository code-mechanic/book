<script>
(function () {
  "use strict";

  function fallbackCopy(text) {
    var textArea = document.createElement("textarea");
    var copied = false;

    textArea.value = text;
    textArea.setAttribute("readonly", "");
    textArea.style.position = "fixed";
    textArea.style.opacity = "0";
    document.body.appendChild(textArea);
    textArea.select();

    try {
      copied = document.execCommand("copy");
    } finally {
      document.body.removeChild(textArea);
    }

    return copied
      ? Promise.resolve()
      : Promise.reject(new Error("Copy command failed"));
  }

  function copyText(text) {
    if (navigator.clipboard && window.isSecureContext) {
      return navigator.clipboard.writeText(text);
    }

    return fallbackCopy(text);
  }

  document.querySelectorAll("pre > code").forEach(function (code) {
    var pre = code.parentElement;
    var container = pre.parentElement;
    var button = document.createElement("button");

    if (!container.classList.contains("sourceCode")) {
      container = document.createElement("div");
      pre.parentNode.insertBefore(container, pre);
      container.appendChild(pre);
    }

    container.classList.add("code-block-wrapper");
    button.type = "button";
    button.className = "copy-code-button";
    button.setAttribute("aria-label", "Copy code to clipboard");
    button.textContent = "Copy";

    button.addEventListener("click", function () {
      copyText(code.textContent).then(function () {
        button.textContent = "Copied!";
      }).catch(function () {
        button.textContent = "Copy failed";
      }).then(function () {
        window.setTimeout(function () {
          button.textContent = "Copy";
        }, 1500);
      });
    });

    container.insertBefore(button, pre);
  });
}());
</script>
