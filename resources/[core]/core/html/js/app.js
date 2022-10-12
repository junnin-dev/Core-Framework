import { registerWindowMethods } from "./testing.js";
import { isEnvBrowser } from "./utils.js";
import {
  determineStyleFromVariant,
  DEV_MODE,
  fetchNotifyConfig,
  NOTIFY_CONFIG,
} from "./config.js";

const { useQuasar } = Quasar;
const { onMounted, onUnmounted } = Vue;

const app = Vue.createApp({
  setup() {
    const $q = useQuasar();

    const showNotif = async ({ data }) => {
      // Otherwise we process any old MessageEvent with a data property
      if (data?.action !== "notify") return;

      const { text, length, type, caption } = data;
      const { classes, icon } = determineStyleFromVariant(type);

      // Make sure we have sucessfully fetched out config properly
      if (!NOTIFY_CONFIG) {
        console.error(
          "The notification config did not load properly, trying again for next time"
        );
        
        await fetchNotifyConfig();
        if (NOTIFY_CONFIG) return showNotif({ data });
      }

      $q.notify({
        message: text,
        multiLine: text.length > 100,
        group: NOTIFY_CONFIG.NotificationStyling.group ?? false,
        progress: NOTIFY_CONFIG.NotificationStyling.progress ?? true,
        position: NOTIFY_CONFIG.NotificationStyling.position ?? "right",
        timeout: length,
        caption,
        classes,
        icon,
      });
    };
    onMounted(() => {
      window.addEventListener("message", showNotif);
    });
    onUnmounted(() => {
      window.removeEventListener("message", showNotif);
    });
    return {};
  },
});

app.use(Quasar, { config: {} });
app.mount("#q-app");

if (DEV_MODE || isEnvBrowser()) {
  registerWindowMethods();
}
