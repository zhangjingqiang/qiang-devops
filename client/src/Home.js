import React, { Component } from 'react'
import { Container, Header, Segment, Button, Icon, Dimmer, Loader, Divider } from 'semantic-ui-react'

class Home extends Component {
  constructor () {
    super()
    this.state = {}
    this.getStacks = this.getStacks.bind(this)
    this.getStack = this.getStack.bind(this)
  }

  componentDidMount () {
    this.getStacks()
  }

  fetch (endpoint) {
    return window.fetch(endpoint)
      .then(response => response.json())
      .catch(error => console.log(error))
  }

  getStacks () {
    this.fetch('/api/stacks')
      .then(stacks => {
        if (stacks.length) {
          this.setState({stacks: stacks})
          this.getStack(stacks[0].id)
        } else {
          this.setState({stacks: []})
        }
      })
  }

  getStack (id) {
    this.fetch(`/api/stacks/${id}`)
      .then(stack => this.setState({stack: stack}))
  }

  render () {
    let {stacks, stack} = this.state
    return stacks
      ? <Container text>
        <Header as='h2' icon textAlign='center' color='teal'>
          <Icon name='unordered list' circular />
          <Header.Content>
            List of skills
          </Header.Content>
        </Header>
        <Divider hidden section />
        {stacks && stacks.length
          ? <Button.Group color='teal' fluid widths={stacks.length}>
            {Object.keys(stacks).map((key) => {
              return <Button active={stack && stack.id === stacks[key].id} fluid key={key} onClick={() => this.getStack(stacks[key].id)}>
                {stacks[key].title}
              </Button>
            })}
          </Button.Group>
          : <Container textAlign='center'>No stacks found.</Container>
        }
        <Divider section />
        {stack &&
          <Container>
            <Header as='h2'>{stack.title}</Header>
            {stack.description && <p>{stack.description}</p>}
            {stack.skills &&
              <Segment.Group>
                {stack.skills.map((skill, i) => <Segment key={i}>{skill.description}</Segment>)}
              </Segment.Group>
            }
            {stack.steps && <p>{stack.steps}</p>}
            {stack.source && <Button basic size='tiny' color='teal' href={stack.source}>Source</Button>}
          </Container>
        }
      </Container>
      : <Container text>
        <Dimmer active inverted>
          <Loader content='Loading' />
        </Dimmer>
      </Container>
  }
}

export default Home
