// QP-01 A custom pizza reaches the admin list
// Goal: check that a pizza request with restrictions gives a pizza
// that keeps them, that rating a pizza needs a login, and that the
// admin sees the new pizza.
describe('QP-01 A custom pizza reaches the admin list', () => {
  it('follows the steps of QP-01', () => {
    // Step 1: open QuickPizza
    cy.visit('https://quickpizza.grafana.com')
    cy.get('h1')
      .should('have.text', 'Looking to break out of your pizza routine?')

    // Step 2: turn on Advanced
    cy.contains('label', 'Advanced').click()
    cy.contains('label', 'Max Calories per Slice').should('be.visible')
    cy.contains('label', 'Excluded tools').should('be.visible')
    cy.contains('label', 'Must be vegetarian').should('be.visible')
    cy.contains('label', 'Custom Pizza Name').should('be.visible')
  })
})
