import $ from 'jquery';
import 'datatables'

$("#table-index-properties").dataTable( {
  language: {
    search: "<i class='fas fa-search'></i>",
    searchPlaceholder: "e.g. : Lyon ",
    // lengthMenu: "Afficher _MENU_ résultats par page",
    // zeroRecords: "Pas d'en-cours",
    // info: "Page _PAGE_ sur _PAGES_",
    // infoEmpty: "No records available",
    // infoFiltered: "(filtré depuis _MAX_ en-cours)",
    paginate: {
      previous: "<i class='fas fa-chevron-left'></i>",
      next: "<i class='fas fa-chevron-right'></i>"
    }
  },
  "dom": '<"top"f>rt<"bottom"lip><"clear">'
});
