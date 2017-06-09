$(() => {
  $('[data-remote="true"]').on('ajax:success', () => {
    window.location = '/'
  });
});
// TODO: Remove this and add proper state mangement for remote forms and links.
