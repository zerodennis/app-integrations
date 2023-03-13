export const fetchTags = async (baseURL, params) => {
  try {
    let tagRequest = await fetch(
      `${baseURL}/api/tags` + '?' + new URLSearchParams(params)
    );

    const tags = await tagRequest.json();
    return tags;
  } catch (error) {
    console.log(error);
    return;
  }
}