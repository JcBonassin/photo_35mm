$('#tag_list-input').selectize({
  delimiter: ",",
  persist: true,
  allowEmptyOption: false,
  create: function (input) {
    return {
      value: input,
      text: input,
    };
  },
});