<script>
  export let result;
  let link = result.link;

  const truncate = (string) => {
    let limit = 50;

    if (string.length > limit) {
      return string.slice(0, limit) + "...";
    }

    return string;
  };
</script>

<hr />

<div class="d-flex mt-4 align-items-center">
  <div class="flex-fill">
    <a href={link.redirect_url}>{link.redirect_url}</a>
    <p class="mb-0 small text-secondary">{truncate(link.destination_url)}</p>
  </div>
  <button class="btn btn-light">Copy</button>
</div>

<div
  class="d-flex align-items-center bg-light p-3 justify-content-between rounded mt-4">
  <p class="mb-0">Want to customize your short link or add your own domain?</p>
  <a href="/register" class="btn btn-white btn-sm">Get Started</a>
</div>
