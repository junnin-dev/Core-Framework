import { fetchNui, isEnvBrowser } from "./utils.js";
import { BrowserMockConfigData } from "./testing.js";

export const DEV_MODE = false;
export let NOTIFY_CONFIG = null;
export const determineStyleFromVariant = (variant) => {
  const variantData = NOTIFY_CONFIG.VariantDefinitions[variant];
  if (!variantData)
    throw new Error(`Style of type: ${variant}, does not exist in the config`);
  return variantData;
};

export const fetchNotifyConfig = async () => {
  NOTIFY_CONFIG = await fetchNui("getNotifyConfig", {}, BrowserMockConfigData);
  if (isEnvBrowser() || DEV_MODE) {
    console.log("Fetched Config:");
    console.dir(NOTIFY_CONFIG);
  }
};

window.addEventListener("load", async () => {
  await fetchNotifyConfig();
});
