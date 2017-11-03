/**
* @prop name - name of currently logged in user
*/

class DashboardHeader extends React.Component {
  render() {
    return (
    	<div>
    		<HeaderSVG />
	    	<div className="dashboard-name">
	    		{this.props.name}
	    	</div>
	    </div>
    );
  }
}
