export const fetchPage = async (baseURL, params) => {
   try {
    let pageRequest = await fetch(
      `${baseURL}/api/app-integrations` + '?' + new URLSearchParams(params)
    );
    const page = await pageRequest.json();
    return page;
  } catch (error) {
    console.log(error);
    return;
  }
};

export const fetchShuffled = async (baseURL, params) => {
  try {
    let pageRequest = await fetch(
      `${baseURL}/api/app-integrations/shuffled` + '?' + new URLSearchParams(params)
    );
    const page = await pageRequest.json();
    return page;
  } catch (error) {
    console.log(error);
    return;
  }
}