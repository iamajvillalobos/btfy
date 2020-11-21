<script>
  import LandingPageResult from "./LandingPageResult.svelte";

  let longURL = "";
  let result;

  $: console.log(result);

  const shortenLink = async () => {
    let data = {
      link: {
        destination_url: longURL,
      },
    };

    let response = await fetch("http://lvh.me:3000/api/v1/links", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${process.env.LANDING_PAGE_USER_API}`,
      },
      body: JSON.stringify(data),
    });

    return response.json();
  };

  const handleSubmit = () => {
    result = shortenLink();
  };
</script>

<form class="d-flex mt-4" on:submit|preventDefault={handleSubmit}>
  <input
    type="url"
    placeholder="Enter long URL"
    class="form-control"
    bind:value={longURL} />
  <button type="submit" class="btn btn-primary ml-3">Shorten</button>
</form>

{#if result !== undefined}
  {#await result then value}
    <LandingPageResult result={value} />
  {/await}
{/if}
