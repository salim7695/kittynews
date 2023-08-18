import gql from 'graphql-tag';

export const POSTS_QUERY = gql`
  query PostsPage {
    viewer {
      id
    }
    posts {
      id
      title
      tagline
      url
      commentsCount
      noOfVotes
      isVoted
    }
  }
`;

export const POST_QUERY = gql`
  query PostsPage($postId: String!) {
    post(postId: $postId) {
      id
      title
      tagline
      url
      commentsCount
      noOfVotes
      isVoted
      comments {
        id
        body
        createdAt
        user {
          name
        }
      }
      user {
        name
      }
    }
  }
`;


export const UPDATE_VOTE = gql`
  mutation PostsPage($postId: String!) {
    voteMutation(postId: $postId) {
      errors
      isVoted
    }
  }
`;
