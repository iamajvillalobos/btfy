<script>
  import ClipboardJS from "clipboard";

  export let result;
  let link = result.link;
  let copyButtonText = "Copy";

  const truncate = (string) => {
    let limit = 50;

    if (string.length > limit) {
      return string.slice(0, limit) + "...";
    }

    return string;
  };

  const handleCopyClick = () => {
    copyButtonText = "Copied";
    setTimeout(() => {
      copyButtonText = "Copy";
    }, 1500);
  };

  new ClipboardJS(".btn-clipboard-copy");
</script>

<hr />

<div class="d-flex mt-4 align-items-center">
  <div class="flex-fill">
    <a href={link.redirect_url}>{link.redirect_url}</a>
    <p class="mb-0 small text-secondary">{truncate(link.destination_url)}</p>
  </div>
  <button
    data-clipboard-text={link.redirect_url}
    class="btn {copyButtonText == 'Copy' ? 'btn-light' : 'btn-primary'} btn-clipboard-copy"
    on:click={handleCopyClick}>{copyButtonText}</button>
</div>

<div
  class="d-flex align-items-center bg-light p-3 justify-content-between rounded mt-4">
  <p class="mb-0">Want to customize your short link or add your own domain?</p>
  <a href="/register" class="btn btn-white btn-sm">Get Started</a>
</div>
