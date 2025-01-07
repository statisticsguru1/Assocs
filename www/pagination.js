document.addEventListener("DOMContentLoaded", function () {
  const table = document.querySelector(".styled-table"); // Select your table
  const rowsPerPage = 10; // Number of rows per page
  const rows = Array.from(table.querySelectorAll("tbody tr")); // Select all rows in the tbody
  const paginationContainer = document.createElement("div"); // Create a div for pagination controls
  paginationContainer.id = "pagination";
  table.parentNode.insertBefore(paginationContainer, table.nextSibling); // Place it after the table

  function displayPage(page) {
    const start = (page - 1) * rowsPerPage;
    const end = start + rowsPerPage;
    rows.forEach((row, index) => {
      row.style.display = index >= start && index < end ? "" : "none";
    });
  }

  function setupPagination() {
    const pageCount = Math.ceil(rows.length / rowsPerPage);
    paginationContainer.innerHTML = "";

    for (let i = 1; i <= pageCount; i++) {
      const button = document.createElement("button");
      button.textContent = i;
      button.className = "pagination-button";
      button.addEventListener("click", () => {
        displayPage(i);
        document.querySelectorAll(".pagination-button").forEach(btn => btn.classList.remove("active"));
        button.classList.add("active");
      });
      paginationContainer.appendChild(button);
    }

    // Set the first button as active and display the first page
    if (paginationContainer.firstChild) {
      paginationContainer.firstChild.classList.add("active");
      displayPage(1);
    }
  }

  setupPagination();
});
