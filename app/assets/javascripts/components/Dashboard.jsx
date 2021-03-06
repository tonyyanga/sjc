class Dashboard extends React.Component {
  render() {
  	const { Tab, Row, Col, Nav, NavItem } = ReactBootstrap;
  	const { user } = this.props;
  	const fullName = `${user.first_name} ${user.last_name}`
		return (
		<div>
			<DashboardHeader name={fullName} />
			<Tab.Container id="dashboard-nav" defaultActiveKey={1}>
				<Row className="clearfix">
					<Col sm={2}>
						<Nav stacked bsClass="nav dashboard-nav-tab" bsStyle="pills">
							<NavItem eventKey={1}>
								Tasks
							</NavItem>
							<NavItem eventKey={2}>
								Clients
							</NavItem>
						</Nav>
					</Col>
					<Col sm={6}>
						<Tab.Content animation>
							<Tab.Pane eventKey={1}>
								<TaskList userId={user.id} />
							</Tab.Pane>
							<Tab.Pane eventKey={2}>
								<ClientList />
							</Tab.Pane>
						</Tab.Content>
					</Col>
				</Row>
			</Tab.Container>
		</div>
		);
  }
}
